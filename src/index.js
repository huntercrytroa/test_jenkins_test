const express = require('express');
const path = require('path');

const app = express();
const port = 3000;

// Middleware เพื่อให้ Express รู้จักไฟล์ static (เช่น CSS, JS, รูปภาพ)
app.use(express.static(path.join(__dirname, 'public')));

// เส้นทางหลักที่ส่งไฟล์ HTML ให้ผู้ใช้
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}/`);
});