## BabySpa Backend

Ini adalah backend dari aplikasi pedikia yang menggunakan framework laravel dan mySQL

### API Documentation

1. `REGISTER` user
    - `POST` -> `/api/register`
    - Request:
      ```json
      {
         "name": "dani",
         "phone": "123123123",
         "address": "teluk jambe",
         "city": "karawang",
         "roles": "pengguna || therapist",
         "email": "dani@gmail.com",
         "password": "12345678"
      }
      ``` 
    - Response:
      ```json
      {
        "meta": {
            "code": 200,
            "status": "success",
            "message": "Success to Register"
        },
        "data": {
            "access_token": "3|PfI0SOs5G7gy7176XFD8Kc0zRXvT4ugQOsLznNKJ",
            "token_type": "Bearer",
            "user": {
                "id": 1,
                "name": "dani",
                "phone": "123123123",
                "address": "teluk jambe",
                "city": "karawang",
                "roles": "pengguna",
                "email": "dani@gmail.com",
                "email_verified_at": null,
                "two_factor_confirmed_at": null,
                "current_team_id": null,
                "profile_photo_path": null,
                "created_at": "2021-04-14T07:13:57.000000Z",
                "updated_at": "2021-04-14T07:13:57.000000Z",
                "profile_photo_url": "https://ui-avatars.com/api/?name=Jennie+Kim&color=7F9CF5&background=EBF4FF"
            }
        }
      }
      ```
2. `LOGIN` user
    - `POST` -> `/api/login`
    - Request:
      ```json
      {
         "email": "dani@gmail.com",
         "password": "12345678"
      }
      ``` 
    - Response:
      ```json
         {
               "meta": {
                  "code": 200,
                  "status": "success",
                  "message": "Authenticated"
               },
               "data": {
                  "access_token": "2|xINN9nawLmDDZKPGHxqQppgf7NRuHCELxp3xDzQW526dba2d",
                  "token_type": "Bearer",
                  "user": {
                        "id": 1,
                        "name": "dani",
                        "phone": "123123123",
                        "address": "teluk jambe",
                        "city": "karawang",
                        "roles": "pengguna",
                        "email": "dani@gmail.com",
                        "email_verified_at": null,
                        "two_factor_confirmed_at": null,
                        "current_team_id": null,
                        "profile_photo_path": null,
                        "created_at": "2024-01-08T06:22:41.000000Z",
                        "updated_at": "2024-01-08T06:22:41.000000Z",
                        "profile_photo_url": "https://ui-avatars.com/api/?name=d&color=7F9CF5&background=EBF4FF"
                  }
               }
            }
      ``` 
3. `LOGOUT` user
    - `POST` -> `/api/logout`
    - Request:
      ```json
      {
         "access_token": "4|QOvbybaax4lxA8oXZ7TIvgv9od8DKQqJqSzzZs5B938e9f11"
      }
      ```
    - Response:
      ```json
      {
         "meta": {
            "code": 200,
            "status": "success",
            "message": "Token Revoked"
         },
         "data": true
      }
      ``` 
4. `UPDATE PROFILE` by ID
    - `POST` -> `/api/user`
    - Request:
      ```json
      {
         "access_token": "4|QOvbybaax4lxA8oXZ7TIvgv9od8DKQqJqSzzZs5B938e9f11",
         {
         "name": "Jennie Kimi Hime",
         "phone": "123123123",
         "address": "teluk jambe",
         "city": "karawang",
         "email": "jennie.kim@blackpink.co",
         }
      }
      ```
    - Response:
      ```json
      {
         "meta": {
            "code": 200,
            "status": "success",
            "message": "Profile Updated"
         },
         "data": {
            "id": 1,
            "name": "Jennie Kimi Hime",
            "phone": "123123123",
            "address": "teluk jambe",
            "city": "karawang",
            "roles": "pengguna",
            "email": "jennie.kim@blackpink.co",
            "email_verified_at": null,
            "two_factor_confirmed_at": null,
            "current_team_id": null,
            "profile_photo_path": null,
            "created_at": "2024-01-08T06:22:41.000000Z",
            "updated_at": "2024-01-08T12:52:08.000000Z",
            "profile_photo_url": "https://ui-avatars.com/api/?name=J+K+H&color=7F9CF5&background=EBF4FF"
         }
      }
      ```
5. `GET` Get user
    - `GET` -> `/api/user`
    - Request:
      ```json
      {
         "access_token": "4|QOvbybaax4lxA8oXZ7TIvgv9od8DKQqJqSzzZs5B938e9f11",
      }
      ```
    - Response:
      ```json
      {
         "meta": {
            "code": 200,
            "status": "success",
            "message": "Data profile user berhasil diambil"
         },
         "data": {
            "id": 1,
            "name": "Jennie Kimi Hime",
            "phone": "123123123",
            "address": "teluk jambe",
            "city": "karawang",
            "roles": "pengguna",
            "email": "jennie.kim@blackpink.co",
            "email_verified_at": null,
            "two_factor_confirmed_at": null,
            "current_team_id": null,
            "profile_photo_path": null,
            "created_at": "2024-01-08T06:22:41.000000Z",
            "updated_at": "2024-01-08T12:52:08.000000Z",
            "profile_photo_url": "https://ui-avatars.com/api/?name=J+K+H&color=7F9CF5&background=EBF4FF"
         }
      }
      ``` 
Dan Masih banyak request lainnya. Untuk menjalankan aplikasi ada catatan pada file note.txt 

Thanks 😁😁😁.

     