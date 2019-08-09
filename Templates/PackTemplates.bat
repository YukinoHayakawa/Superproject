for /f "tokens=*" %%G in ('dir /b /a:d') do (
    rm "%%G.zip"
    7z a -tzip -r "%%G.zip" ".\%%G\*" )
