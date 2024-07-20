# ใช้ base image ของ Node.js เวอร์ชั่น 14 สำหรับการ build
FROM node:16 AS build

# ตั้งค่า working directory เป็น /app
WORKDIR /app

# คัดลอกไฟล์ทั้งหมดไปยัง working directory
COPY . .

# ติดตั้ง dependencies และสร้างแอปพลิเคชัน
RUN npm install
RUN npm run build

# ใช้ base image ของ Node.js เวอร์ชั่น 14 สำหรับการรันแอปพลิเคชัน
FROM node:14

# ตั้งค่า working directory เป็น /app
WORKDIR /app

# คัดลอกไฟล์ที่จำเป็นจาก stage การ build
COPY --from=build /app .

# กำหนดคำสั่งเริ่มต้นเมื่อ container รัน
CMD ["node", "src/index.js"]
