name: test
on: [push, pull_request]
jobs:
  fixtures:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run fixture tests
        run: ./test.sh
