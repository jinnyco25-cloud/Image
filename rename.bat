@echo off
chcp 64901 > nul
setlocal enabledelayedexpansion

:: 모든 하위 폴더를 순회합니다
for /d %%D in (*) do (
    echo 현재 폴더: %%D 작업 중...
    set count=0
    pushd "%%D"
    
    :: 폴더 내 모든 jpg 파일을 찾아 이름 변경
    for %%F in (*.jpg) do (
        if !count! == 0 (
            :: 첫 번째 파일은 [폴더명.jpg]
            ren "%%F" "%%D.jpg"
        ) else (
            :: 두 번째 파일부터는 [폴더명_순번.jpg]
            ren "%%F" "%%D_!count!.jpg"
        )
        set /a count+=1
    )
    popd
)

echo 모든 작업이 완료되었습니다! 대표님, 이제 깃허브에 올리셔도 됩니다.
pause