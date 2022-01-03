import sys
import os
import datetime
from os.path import dirname, realpath, join
from PySide2.QtWidgets import QApplication, QWidget
from PySide2.QtCore import QFile
from PySide2.QtUiTools import QUiLoader
from PySide2.QtUiTools import *
from PyQt5 import QtCore, QtGui, QtQml
from PySide2.QtCore import QFile
from PySide2.QtUiTools import *

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal, QTimer, QUrl

from PySide2.QtWidgets import QApplication, QMainWindow
from PySide2.QtCore import QFile
from PySide2.QtUiTools import QUiLoader


class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)

        # QTimer - Run Timer
        self.timer = QTimer()
        self.timer.timeout.connect(lambda: self.setTime())
        self.timer.start(1000)

    # Signal Set Name
    setName = Signal(str)

    # Signal Set Data
    printTime = Signal(str)

    # Signal Visible
    isVisible = Signal(bool)

    # Open File To Text Edit
    readText = Signal(str)

    # Text String
    textField = ""

    # Open File
    @Slot(str)
    def openFile(self, filePath):
        file = open(QUrl(filePath).toLocalFile(), encoding="utf-8")
        text = file.read()
        file.close()
        print(text)
        self.readText.emit(str(text))

    # Read Text
    @Slot(str)
    def getTextField(self, text):
        self.textField = text

    # Write File
    @Slot(str)
    def writeFile(self, filePath):
        file = open(QUrl(filePath).toLocalFile(), "w")
        file.write(self.textField)
        file.close()
        print(self.textField)

    # Show / Hide Rectangle
    @Slot(bool)
    def showHideRectangle(self, isChecked):
        print("Is rectangle visible: ", isChecked)
        self.isVisible.emit(isChecked)

    # Set Timer Function
    def setTime(self):
        now = datetime.datetime.now()
        formatDate = now.strftime("Now is %H:%M:%S %p of %Y/%m/%d")
        print(formatDate)
        self.printTime.emit(formatDate)

    # Function Set Name To Label
    @Slot(str)
    def welcomeText(self, name):
        self.setName.emit("Welcome, " + name)
