# Итоговая работа

В папке ./cmd код четырех приложений на языке Go.
   - root-service
   - api-service
   - info-service
   - login-service

Все программы принимают на входе значения переменных окружения в виде ***_APP_NAME и ***_BIND_PORT.

(*** соответствует префиксу программы - ROOT, API, INFO, LOGIN)

1. Сделать Deployment'ы для Kubernetes:
   - root-app (x2)
   - api-app (x4)
   - info-app (x1)
   - login-app (x1)
  
2. Передача переменных окружения через ConfigMap'ы

3. Сделать сервисы для Deployment'ов
   - root-service
   - api-service
   - info-service
   - login-service

4. Сделать Ingress для сервисов
   - "/" -> root-service
   - "/api" -> api-service
   - "/info" -> info-service
   - "/login" -> login-service

5. Делать сценарии автоматизации для Gitea
   - Lint_and_Test - использовать линтер golangci-lint и команду "go test ./...". Должен запускаться при изменении любых файлов *.go и go.mod

   - Build_Container - компиляция исходного кода и сборка контейнера. Сделать Dockerfile'ы, скомпилировать код приложений, упаковать в контейнеры и отправить в репозиторий. Должен запускаться на событие установки тега в виде "v*"

   - Deploy_to_Kubernetes - отправка изменений в кластер Kubernrtes. Должен запускаться на событие "release"