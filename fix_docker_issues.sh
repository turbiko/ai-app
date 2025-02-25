#!/bin/bash

echo "🔧 Перезапускаємо Docker..."
sudo systemctl restart docker

echo "🛑 Видаляємо всі контейнери, томи та сирітські контейнери..."
docker-compose down --volumes --remove-orphans

echo "🧹 Очищуємо систему Docker (видаляємо всі кеші, образи, контейнери, томи)..."
docker system prune -a -f

echo "♻️ Перезапускаємо Docker ще раз..."
sudo systemctl restart docker

echo "✅ Всі проблеми з Docker повинні бути вирішені!"
