set -e

bin/rails css:install:tailwind
bin/rails javascript:install:esbuild
yarn add daisyui
bin/rails db:migrate

rm -f tmp/pids/server.pid && bin/dev
