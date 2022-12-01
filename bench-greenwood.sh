cd greenwood

mkdir -p ./src/pages/posts

rm -rf dist
rm -rf ./src/pages/posts/*.md
echo "[bench] Clean complete"

if [ -z "$1" ]
  then count="1000"
else
  count="$1"
fi
cp ../_markdown-samples/$count/* ./src/pages/posts/
echo "[bench] Setup complete $count pages"

time npx @greenwood/cli build
echo "[bench] Build complete $count pages"

echo "[bench] Framework version"
npx @greenwood/cli --version

rm -rf ./src/pages/posts/*.md
echo "[bench] Posts cleanup complete"