
# Transisi Test Interview APP

Ini adalah sebuah aplikasi list employee yang menggunakan global api https://reqres.in/

## Page dan fitur:
- #### Login Page
    - Validator input email dan password (tidak boleh kosong)
    - animasi loading
- #### Home Page
    - Menggunakan state management BLOC / Cubit
    - Terdapat view skeleton jika sedang loading load data dari api
    - List employee terdapat data nama, email dan avatar
- #### Detail Page
    - Menampilkan data sesuai index yang dipilih user
    - Bisa mengarahkan ke phone dial jika onTap card phone
    - Bisa mengarahkan ke aplikasi email jika onTap card email
    - Terdapat fitur share yang berisi konten nama dan email employee
- #### Create Page
    - Terdapat fitur valodator input
    - Terdapat fitur memilih foto jika user onTap icon gambar yang diatas (foto dari galery).
    - Menggunakan state management BLOC / Cubit

### Screenshot APP
<p align="center">
  <img src="https://github.com/2001arman/flutter_employee_list_transisi/blob/master/assets/login_page.jpg" width="350" title="hover text">
</p>
![alt text](https://github.com/2001arman/flutter_employee_list_transisi/blob/master/assets/login_page.jpg)

