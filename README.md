Способы обхода ограничений AnyDesk

![image](https://github.com/user-attachments/assets/12a6adb3-affd-40c6-834c-ac03dbda3028)

1) Сброс идентификатора рабочего стола

Данный метод заключается в генерации нового идентификатора AnyDesk, что позволяет обходить установленные AnyDesk ограничения.
Для этого используется скрипт, который удаляет определенные файлы и папки по следующим путям: C:\ProgramData\AnyDesk и C:\Users\UserName\AppData\Roaming\AnyDesk.
При этом сохраняется значение переменной ad.roster.items, чтобы оставить историю подключений, но при этом сбросить идентификатор рабочего стола.

2) Использование старой версии AnyDesk

В версии AnyDesk 6.0.8 нет ограничений на бесплатное использование, поскольку она не требует платной подписки.
Скачать её можно с официального сайта через Web Archive: [ссылка](https://web.archive.org/web/20200903224422/https://anydesk.com/en/downloads/windows), либо воспользоваться нашим репозиторием.

For english version refer to [readme.eng.md](https://github.com/kreker0001/AnyDesk-CountDown-999-second/blob/main/readme.eng.md)
