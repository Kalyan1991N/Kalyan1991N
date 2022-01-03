# This Python file uses the following encoding: utf-8
# This Python file uses the following encoding: utf-8
import sys
import os
import datetime
from os.path import dirname, realpath, join
from PySide2.QtWidgets import QApplication, QWidget, QMainWindow
from PySide2.QtCore import QFile
from PySide2.QtUiTools import QUiLoader
from PySide2.QtUiTools import *
from PyQt5 import QtCore, QtGui, QtQml
from PySide2.QtCore import QFile
from PySide2.QtUiTools import *
import numpy as np
import pandas as pd

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal, QTimer, QUrl
from models import DataFrameModel
from home import MainWindow


CURRENT_DIR = os.path.dirname(os.path.realpath(__file__))

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()


    # Get Context

    csv_path = os.path.join(CURRENT_DIR, "tele.csv")
    df = pd.read_csv(csv_path)
    model = DataFrameModel(df)
    engine = QQmlApplicationEngine()
    engine.rootContext().setContextProperty("table_model", model)

    main = MainWindow()
    engine.rootContext().setContextProperty("backend", main)
    engine.load(os.path.join(os.path.dirname(__file__), "qml/main.qml"))

    # Set App Extra Info
    app.setOrganizationName("Kalyan N")
    app.setOrganizationDomain("Data Mining with Safety")

    # Load QML File

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
