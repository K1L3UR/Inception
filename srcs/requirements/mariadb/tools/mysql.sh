#creation database
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

#cree utilisateur pour utiliser la database
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

#donne tous les droits a l'utilisateur
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

#modification des droits de root + mdp
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

#actualisation force
mysql -e "FLUSH PRIVILEGES;"

#redemarrer MySQL pour que ca marche
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

#il faut ferme la DB avant de la redemarrer
exec mysqld_safe