## ヒレガス本の例題を Swift で書いてみる(1)

swiftの勉強に、ヒレガス本こと「Max OS X Cocoa プログラミング」の例題を swift で書いてみることにした。
手元には2009年に出た第３版しかなく、内容がちと古いかもしれないがしかたない。

とりあえず手始めに、第２章「さあ、始めましょう」で取り上げられている「乱数生成アプリケーション」を swift で書いてみる。環境は Yosemite + XCode 6.1。


ソース：[https://github.com/hugo-sb/Hillegass-ch2](https://github.com/hugo-sb/Hillegass-ch2)

![スクリーンショット 2014-10-27 23.58.31.png](https://qiita-image-store.s3.amazonaws.com/0/31482/02fb13f0-b39d-a3c5-037c-7abbb965b934.png "スクリーンショット 2014-10-27 23.58.31.png")

書籍では Foo というクラスを作成し、そこにコードを書いていくという形だったが、今回は XCode が自動生成してくれた ViewController クラスにコードを追加していくことした。

プログラム自体は最初のプログラムということで単純なものだが、`srandom()` や `random()` といった C の標準関数が Swift から呼べるのか心配だった。でも実際に書いてみたらあっさり呼べたのでいささか拍子抜け（`Cocoa` をインポートしてる中で読み込まれているのだろうか？）。ただ、`time()` が引数に `time_t*` を渡すのだが、これの書き方が判らずネットを調べることになった。

[Using Swift with Cocoa and Objective-C: Interacting with C APIs](https://developer.apple.com/library/ios/documentation/swift/conceptual/buildingcocoaapps/InteractingWithCAPIs.html)

上記リンクをみると、C言語同様、変数に「&」をつけてやればアドレスを渡せるようだ。

ちなみに乱数の取得は、`random()` ではなく、`arc4random_uniform()` を使うのがイマドキらしいので、そちらを利用した版も追加してみた（といっても呼び出してる関数が違うだけだが）。
