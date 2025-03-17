@echo off

type NUL && "%CODEQL_DIST%\codeql.exe" database index-files ^
    --prune=**/*.testproj ^
    --include-extension=.rb ^
    --include-extension=.erb ^
    --include-extension=.gemspec ^
    --include=**/Gemfile ^
    --size-limit=5m ^
    --language=clarity ^
    --working-dir=. ^
    "%CODEQL_EXTRACTOR_CLARITY_WIP_DATABASE%"

exit /b %ERRORLEVEL%
