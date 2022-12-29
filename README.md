# Guía

La siguiente guía está destinada para los equipos que emplean el sistema operativo _Windows 10_.

## 1. Requisitos previos

1.1 Tener instalado un servidor local MySQL.\
1.1.1 Haber creado una base de datos __vacía__ con nombre _inventario_.\
1.2 Tener instalado PHP 8.0.2.\
1.3 Tener instalado [Composer](https://getcomposer.org/Composer-Setup.exe).\
1.4 Tener instalado [Node.js](https://nodejs.org/es/download/), versión LTS.\
1.5 Tener instalado [Git](https://git-scm.com/download/win) y vinculado a tu cuenta en [GitHub](https://github.com/).\
1.6 Haber descargado y descomprimido [MailHog](https://github.com/mailhog/MailHog/releases/latest).\
1.7 Haber generado la clave de sitio web y la clave secreta de [reCAPTCHA v2](https://www.google.com/recaptcha/admin/create) para el dominio `localhost`.

## 2. Preparación del entorno de trabajo

2.1 Ejecuta tu servidor MySQL.\
2.2 Clona el repositorio del proyecto.\
2.3 Ingresa a la carpeta recién clonada y abre PowerShell en esa ubicación.\
2.4 Ejecuta la siguiente línea y espera a que culmine el proceso: `composer install`.\
2.5 Ejecuta la siguiente línea y espera a que culmine el proceso: `npm install`.\
2.6 Regresa al explorador de Windows.\
2.7 Copia el archivo `.env.example` y pégalo, en el mismo directorio, con nombre `.env`.\
2.8 Abre el archivo _.env_ con tu editor de texto preferido.\
2.9 Ubícate en las líneas `DB_USERNAME=` y `DB_PASSWORD=` y escribe al lado las credenciales de la base de datos.\
2.10. Ubícate en las líneas `RECAPTCHA_SITE_KEY` y `RECAPTCHA_SECRET_KEY` y escribe al lado las claves de reCAPTCHA.\
2.11 Guarda los cambios.\
2.12 Regresa al explorador de Windows.\
2.13 Ubícate en la carpeta `resources\js\vue\components`.\
2.14 Abre los archivos `AutenticacionInicioSesion.vue` y `AutenticacionRestablecimiento.vue` con tu editor de texto preferido.\
2.15 Reemplaza en ambos archivos el texto `RECAPTCHA_SITE_KEY` por la clave de sitio web de reCAPTCHA.\
2.16 Guarda los cambios.\
2.17 Regresa a la ventana de PowerShell.\
2.18 Ejecuta la siguiente línea: `php artisan key:generate`.\
2.19 Ejecuta la siguiente línea y espera a que culmine el proceso: `php artisan migrate --seed`.\
2.20 Ejecuta la siguiente línea: `php artisan storage:link`.


## 3. Poner en marcha el proyecto en desarrollo

Estos son los pasos que debes realizar cada vez que desees visualizar el proyecto en el navegador:

### 3.1 Ejecutar el servidor MySQL

### 3.2 Ejecutar el servidor PHP

3.2.1 Abre PowerShell desde la carpeta del repositorio del proyecto.\
3.2.2 Ejecuta la siguiente línea y espera a que culmine el proceso: `php artisan serve`.\
3.2.2 Asegura la dirección que te muestra, incluyendo la parte del puerto. No cierres la venta o se detendrá el servidor.

### 3.3 Ejecutar el módulo para recarga en caliente

Cuando edites algo del _frontend_, los cambios se verán inmediatamente reflejados en el navegador; a esto se le llama recarga en caliente:\
\
3.3.1 Abre PowerShell desde la carpeta del repositorio del proyecto.\
3.3.2 Ejecuta la siguiente línea y espera a que culmine el proceso: `npm run hot`. No cierres la venta o se detendrá el módulo.

### 3.4 Ejecutar el servidor de correo

3.4.1 Ejecuta MailHog (referirse al paso 1.6). No cierres la ventana o se detendrá el servicio.\
3.4.2 Accede a la siguiente dirección IP: `http://localhost:8025/`.

### 3.5 Ver la página

Simplemente visita la dirección que guardaste en el paso 3.2.2 (cambia `127.0.0.1` por `localhost`), usualmente es: `http://localhost:8000`.

#### 3.5.1 Credenciales

Correo electrónico: `admin@example.com`\
Contraseña: `admin@IWAPP#22`