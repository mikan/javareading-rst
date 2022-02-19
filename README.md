# javareading-rst

Java 読書会 BOF の議事録執筆用 Sphinx 環境

## 必要なもの

- Python 3
- Sphinx
- GNU Make

Debian の場合:

```
sudo apt install python3-sphinx make
```

## 使い方

1. `.rst` を書く (e.g. `microservice7.rst`)
2. `make html` で HTML をビルドする
3. `_build/html` に吐かれた HTML をブラウザで開いて確認する (例: `open _build/html/microservice7.html`)

## 提出物

### rst

- そのまま提出

### html

- `<head>` 内にある全ての `<script>` 、索引・検索・ `custom.css` の `<link>`は不要なので消す
- 念の為ブラウザで開いて表示を確かめる
- 提出

## テンプレ

[example.rst](example.rst) を参照してください。

## License

[BSD 3-Clause License](LICENSE)

## Author

- [mikan](https://github.com/mikan)
