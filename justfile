
default:
  just --list

setupIde:
  mill mill.bsp.BSP/install

compile:
  mill project.compile

test:
  mill project.test

checkOpts:
  mill project.run --help

jvmServe:
  mill project.run --build-tool scala-cli --project-dir /Users/simon/Code/helloScalaJs --out-dir /Users/simon/Code/helloScalaJs/out --styles-dir /Users/simon/Code/helloScalaJs/styles --log-level info --browse-on-open-at / --port 3005

jvmServeNoStyles:
  mill project.run --build-tool scala-cli --project-dir /Users/simon/Code/helloScalaJs --out-dir /Users/simon/Code/helloScalaJs/out

jvmLinker:
  mill project.run --build-tool scala-cli --project-dir /Users/simon/Code/helloScalaJs --out-dir /Users/simon/Code/helloScalaJs/out --extra-build-args --js-cli-on-jvm --port 3007

serveMill:
  mill project.run --build-tool mill --project-dir /Users/simon/Code/mill-full-stack/mill-full-stack --styles-dir /Users/simon/Code/mill-full-stack/mill-full-stack/frontend/ui/assets  --out-dir /Users/simon/Code/mill-full-stack/mill-full-stack/out/frontend/fastLinkJS.dest --log-level info --proxy-target-port 8080 --proxy-prefix-path /api --port 3007 --mill-module-name frontend

setupPlaywright:
  cs launch com.microsoft.playwright:playwright:1.41.1 -M "com.microsoft.playwright.CLI" -- install --with-deps

publish:
  mill

setupMill:
  curl -L https://raw.githubusercontent.com/lefou/millw/0.4.11/millw > mill && chmod +x mill

format:
  mill mill.scalalib.scalafmt.ScalafmtModule/reformatAll __.sources

fix:
  mill __.fix

gha: setupMill setupPlaywright test
