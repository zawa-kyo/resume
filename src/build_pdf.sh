#!/bin/bash

readme_file="README.md"
resume_file="Resume.md"
stylesheet_file="style.css"

# ファイルを結合してResume.mdを生成する関数
combine_files() {
    cat src/header.md $readme_file > $resume_file
    echo "😎Files combined into $resume_file"
}

# スタイルシートを準備し、PDFを生成する関数
build_pdf() {
    # スタイルシートが存在しない場合、空のファイルを作成
    [ -f "$stylesheet_file" ] || touch "$stylesheet_file"

    # GitHub Markdown CSSをスタイルシートファイルにコピー
    cat node_modules/github-markdown-css/github-markdown-light.css > "$stylesheet_file"

    # スタイルシートから`.markdown-`クラスを削除
    sed -i '' 's/\.markdown-//g' "$stylesheet_file"

    # PDFを生成
    bun x md-to-pdf ./$resume_file --stylesheet "$stylesheet_file"
    echo "🚀PDF generated."

    # スタイルシートファイルを削除
    rm "$stylesheet_file"

    echo "🧹Stylesheet $stylesheet_file removed."
}

# 生成した中間ファイルを削除する関数
cleanup_files() {
    rm $resume_file
    echo "🧹Intermediate file $resume_file removed."
}

# メイン関数
main() {
    combine_files
    build_pdf
    cleanup_files
}

# スクリプト実行
main
