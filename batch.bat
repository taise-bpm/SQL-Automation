for %%G in (*.sql) do sqlcmd /S LAPTOP-FTE91IQE /d SeedifyDB -E -i"%%G"
pause