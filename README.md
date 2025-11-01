# 🥔 Potato Trading API

API de trading de pommes de terre développée avec Ruby on Rails.

## 🛠️ Technologies

- Ruby on Rails 8.0.2
- SQLite3
- Ruby 3.x

## 🚀 Installation et lancement
```bash
# Cloner le projet
git clone https://github.com/AymanIs/potato-trader.git
cd potato_trader

# Installer les dépendances
bundle install

# Créer et initialiser la base de données
rails db:create
rails db:migrate
rails db:seed

# Lancer le serveur
rails server
```

## 📍 Accès

- **Interface web**: http://localhost:3000
- **API 1 (Cours)**: http://localhost:3000/prices?date=2024-11-15
- **API 2 (Gain max)**: http://localhost:3000/best_gain?date=2024-11-15

## ✨ Interface utilisateur

Une interface web a été ajoutée pour une meilleure expérience utilisateur et faciliter les tests. Les APIs retournent toujours du JSON pur comme demandé dans le test technique.

## 📅 Dates de test disponibles

- 2024-11-15
- 2024-11-16
- 2024-11-17

## 📝 Note

Projet réalisé dans le cadre d'un test technique. Les APIs respectent toutes les contraintes métier demandées (100 tonnes max, pas de vente à découvert, day-trading uniquement).