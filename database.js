const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
const port = 3000;

// Підключення до MySQL
const conn = mysql.createConnection({
    host: "127.0.0.1",
    user: "root",
    password: "12345678",
    database: "school"
});

conn.connect((err) => {
    if (err) {
        console.log("Помилка підключення до бази даних: " + err.stack);
        return;
    }
    console.log("Підключено до бази даних MySQL.");
});

// Мідлвар для парсингу JSON
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Додаємо мідлвар для підтримки CORS
app.use(cors());

// **Робота з учнями**
// Додати учня
app.post('/addStudent', (req, res) => {
    const { firstname, lastname, birthdate, classid, address, phonenumber, email } = req.body;

    if (!firstname || !lastname || !birthdate || !classid || !address || !phonenumber || !email) {
        return res.status(400).send("Усі поля мають бути заповнені.");
    }

    const query = "INSERT INTO Students (FirstName, LastName, BirthDate, ClassID, Address, PhoneNumber, Email) VALUES (?, ?, ?, ?, ?, ?, ?)";

    conn.query(query, [firstname, lastname, birthdate, classid, address, phonenumber, email], (err, result) => {
        if (err) {
            console.error("Помилка при додаванні учня: ", err);
            return res.status(500).send("Помилка додавання учня");
        }
        res.send("Учня успішно додано");
    });
});

// Оновити дані учня
app.put('/updateStudent/:id', (req, res) => {
    const studentId = req.params.id;
    const { firstname, lastname, birthdate, classid, address, phonenumber, email } = req.body;

    if (!firstname || !lastname || !birthdate || !classid || !address || !phonenumber || !email) {
        return res.status(400).send("Усі поля мають бути заповнені.");
    }

    const query = `
        UPDATE Students
        SET FirstName = ?, LastName = ?, BirthDate = ?, ClassID = ?, Address = ?, PhoneNumber = ?, Email = ?
        WHERE StudentID = ?
    `;

    conn.query(query, [firstname, lastname, birthdate, classid, address, phonenumber, email, studentId], (err, result) => {
        if (err) {
            console.error("Помилка при оновленні даних учня: ", err);
            return res.status(500).send("Помилка оновлення даних учня");
        }
        if (result.affectedRows === 0) {
            return res.status(404).send("Учня не знайдено");
        }
        res.send("Дані учня успішно оновлено");
    });
});

// Видалити учня
app.delete('/deleteStudent/:id', (req, res) => {
    const studentId = req.params.id;

    const query = "DELETE FROM Students WHERE StudentID = ?";

    conn.query(query, [studentId], (err, result) => {
        if (err) {
            console.error("Помилка при видаленні учня: ", err);
            return res.status(500).send("Помилка видалення учня");
        }
        if (result.affectedRows === 0) {
            return res.status(404).send("Учня не знайдено");
        }
        res.send("Учня успішно видалено");
    });
});

// **Робота з вчителями**
// Додати вчителя
app.post('/addTeacher', (req, res) => {
    const { fullName, birthdate, phonenumber, email } = req.body;

    if (!fullName || !birthdate || !phonenumber || !email) {
        return res.status(400).send("Усі поля мають бути заповнені.");
    }

    const query = "INSERT INTO Teachers (FullName, BirthDate, PhoneNumber, Email) VALUES (?, ?, ?, ?)";

    conn.query(query, [fullName, birthdate, phonenumber, email], (err, result) => {
        if (err) {
            console.error("Помилка при додаванні вчителя: ", err);
            return res.status(500).send("Помилка додавання вчителя");
        }
        res.send("Вчителя успішно додано");
    });
});

// Оновити дані вчителя
app.put('/updateTeacher/:id', (req, res) => {
    const teacherId = req.params.id;
    const { fullName, birthdate, phonenumber, email } = req.body;

    if (!fullName || !birthdate || !phonenumber || !email) {
        return res.status(400).send("Усі поля мають бути заповнені.");
    }

    const query = `
        UPDATE Teachers
        SET FullName = ?, BirthDate = ?, PhoneNumber = ?, Email = ?
        WHERE TeacherID = ?
    `;

    conn.query(query, [fullName, birthdate, phonenumber, email, teacherId], (err, result) => {
        if (err) {
            console.error("Помилка при оновленні даних вчителя: ", err);
            return res.status(500).send("Помилка оновлення даних вчителя");
        }
        if (result.affectedRows === 0) {
            return res.status(404).send("Вчителя не знайдено");
        }
        res.send("Дані вчителя успішно оновлено");
    });
});

// Видалити вчителя
app.delete('/deleteTeacher/:id', (req, res) => {
    const teacherId = req.params.id;

    const query = "DELETE FROM Teachers WHERE TeacherID = ?";

    conn.query(query, [teacherId], (err, result) => {
        if (err) {
            console.error("Помилка при видаленні вчителя: ", err);
            return res.status(500).send("Помилка видалення вчителя");
        }
        if (result.affectedRows === 0) {
            return res.status(404).send("Вчителя не знайдено");
        }
        res.send("Вчителя успішно видалено");
    });
});
// Отримати розклад за номером класу
app.get('/schedule/:className', (req, res) => {
    const className = req.params.className; // Отримуємо назву класу з параметрів URL

    const query = `
        SELECT
            schedule.ScheduleID,
            schedule.Time,
            schedule.Classroom,
            classes.ClassName,
            subjects.Name AS Subject,
            teachers.FullName AS Teacher
        FROM schedule
                 JOIN classsubjects ON schedule.ClassSubjectID = classsubjects.ClassSubjectID
                 JOIN classes ON classsubjects.ClassID = classes.ClassID
                 JOIN subjects ON classsubjects.SubjectID = subjects.SubjectID
                 JOIN teachers ON subjects.TeacherID = teachers.TeacherID
        WHERE classes.ClassName = ?
        ORDER BY schedule.Time;
    `;

    conn.query(query, [className], (err, results) => {
        if (err) {
            console.error("Помилка при отриманні розкладу: ", err);
            return res.status(500).send("Помилка отримання розкладу");
        }
        if (results.length === 0) {
            return res.status(404).send("Розклад для цього класу не знайдено");
        }
        res.json(results);
    });
});

// Запуск сервера
app.listen(port, () => {
    console.log(`Сервер працює на http://localhost:${port}`);
});
