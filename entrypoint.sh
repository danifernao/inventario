#!/bin/bash
# Indica que el script se debe ejecutar con Bash.

set -e
# Hace que el script se detenga si ocurre cualquier error.

# Genera la clave de la aplicación.
php artisan key:generate

# Espera a que MySQL esté listo.
dockerize -wait tcp://database:3306 -timeout 60s

# Destruye las tablas existentes y ejecuta las migraciones.
php artisan migrate:fresh --seed

# Crea un enlace simbólico desde public/storage hacia storage/app/public para acceso público a archivos.
php artisan storage:link

echo "Iniciando Apache. Laravel estará listo en http://localhost/"

# Inicia Apache.
apache2-foreground