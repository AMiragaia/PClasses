import PyInstaller.__main__

PyInstaller.__main__.run([
    'client_com_menu.py',
    '--onefile',
    '--hidden-import=os',
    '--hidden-import=subprocess',
    '--hidden-import=sys',
    '--hidden-import=socket',
    '--hidden-import=base64',
    '--hidden-import=Crypto.Cipher',
    '--hidden-import=common_comm',
    '--noconsole'
])