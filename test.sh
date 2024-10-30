set -eo pipefail

COLOR_GREEN=`tput setaf 2;`
COLOR_NC=`tput sgr0;` # No Color

echo "Starting black"
poetry run black .

echo "Starting isort"
poetry run isort .

echo "Starting mypy"
poetry run mypy .

echo "Starting pytest with coverage"
poetry run coverage run -m pytest # coverage 를 측정하면서 "pytest"를 실행할 것이다.

poetry run coverage report -m # 그래서, 테스트는 다 끝났는데, coverage 가 어떻게 되는 지 조회할 것이다.
poetry run coverage html

echo "${COLOR_GREEN}All tests passed successfully!${COLOR_NC}"
