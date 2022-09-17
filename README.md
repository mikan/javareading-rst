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

## テンプレ

[example.rst](example.rst) を参照してください。

## 提出物

### rst

そのまま

### html

1. `<head>` 内にある全ての `<script>` 、索引・検索・ `custom.css` の `<link>`は不要なので消す
2. `<head>` 内にある 2 つの CSS の外部リンクのパスにある `_static` を `css` に変える (`javareading.com` サーバーに合わせる)

### zip

メーリングリストには1度に1ファイルしか添付できないため zip にする

```
make zip
```

## License

[BSD 3-Clause License](LICENSE)

## Author

- [mikan](https://github.com/mikan)
