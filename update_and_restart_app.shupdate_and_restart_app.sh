#!/bin/bash

echo "🔄 Оновлюємо код застосунку..."
git pull --recurse-submodules

echo "📦 Оновлюємо підмодулі Git..."
git submodule update --init --recursive

# Перевіряємо, чи змінився Dockerfile або requirements.txt
if git diff --name-only HEAD~1 | grep -qE 'Dockerfile|requirements.txt'; then
    echo "⚠️ Виявлено зміни у вимогах! Перебудова контейнера..."
    docker-compose up -d --build
else
    echo "🔄 Оновлено код. Просто перезапускаємо контейнер..."
    docker-compose restart ai-app
fi

echo "✅ Оновлення завершене!"
