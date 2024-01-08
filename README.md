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

    - Response:
      ```json
      "status": {
         "code": 200,
         "message": "Ok"
      },
      "data": [
        {
           "id": "a81bc81b-dead-4e5d-abff-90865d1e13b1",
           "date": "2023-12-08 05:17:42.583767+07",
           "amount": 250000,
           "transactionType": "CREDIT",
           "balance": 50000000,
           "description": "Tambahan jajan",
           "createdAt": "2023-12-08 05:17:42.583767+07",
           "updatedAt": "2023-12-08 05:17:42.583767+07"
        }
      ],
      "paging": {
         "page": 1,
         "totalPages": 2,
         "totalRows": 10,
         "rowsPerPage": 5
      }
      ``` 
4. `GET` by ID
    - `GET` -> `/api/v1/expenses/a81bc81b-dead-4e5d-abff-90865d1e13b1`
    - Response:
      ```json
      "status": {
         "code": 200,
         "message": "Created"
      },
      "data": {
         "id": "a81bc81b-dead-4e5d-abff-90865d1e13b1",
         "date": "2023-12-08 05:17:42.583767+07",
         "amount": 250000,
         "transactionType": "CREDIT",
         "balance": 50000000,
         "description": "Tambahan jajan",
         "createdAt": "2023-12-08 05:17:42.583767+07",
         "updatedAt": "2023-12-08 05:17:42.583767+07"
      }
5. `GET` berdasarkan tipe transaksi
    - `GET` -> `/api/v1/expenses/type/:type`
    - Params:
      ```
      /credit
      /debit
      ``` 
    - Response:
      ```json
      "status": {
         "code": 200,
         "message": "Ok"
      },
      "data": [
        {
           "id": "a81bc81b-dead-4e5d-abff-90865d1e13b1",
           "date": "2023-12-08 05:17:42.583767+07",
           "amount": 250000,
           "transactionType": "CREDIT",
           "balance": 50000000,
           "description": "Tambahan jajan",
           "createdAt": "2023-12-08 05:17:42.583767+07",
           "updatedAt": "2023-12-08 05:17:42.583767+07"
        }
      ],
      "paging": {
         "page": 1,
         "totalPages": 2,
         "totalRows": 10,
         "rowsPerPage": 5
      }
      ``` 
6. `UPDATE` pengeluaran
    - `PUT` -> `/api/v1/expenses`
    - Request:
      ```json
      {
         "id": "a81bc81b-dead-4e5d-abff-90865d1e13b1",
         "amount": 240000,
         "transactionType": "CREDIT",
         "description": "Tambahan jajan"
      }
      ``` 
    - Response:
      ```json
      "status": {
         "code": 200,
         "message": "Updated"
      },
      "data": {
         "id": "a81bc81b-dead-4e5d-abff-90865d1e13b1",
         "date": "2023-12-08 05:17:42.583767+07",
         "amount": 240000,
         "transactionType": "CREDIT",
         "description": "Update jajan",
         "createdAt": "2023-12-08 05:17:42.583767+07",
         "updatedAt": "2023-12-08 05:17:42.583767+07"
      }
      ``` 
- `DELETE` pengeluaran
    - `DELETE` -> `/api/v1/expenses/a81bc81b-dead-4e5d-abff-90865d1e13b1`
    - Response:
      ```
      204 no content
      ```
     