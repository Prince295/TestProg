# -*- coding: utf-8 -*-
import sys
import re
from PyQt5.QtWidgets import *
from PyQt5.QtGui import QIcon

class Main_form(QWidget):

    def __init__(self):
        super().__init__()

        self.initUI()

    def initUI(self):
        grid=QGridLayout()
        self.setLayout(grid)
        self.btn = QPushButton( 'Script', self )
        grid.addWidget(self.btn, 0,0)
        self.btn.clicked.connect( self.showDialog )

        self.output = QLabel(self)
        grid.addWidget(self.output,1,0)

        self.setGeometry( 300, 300, 290, 150 )
        self.setWindowTitle( 'Input dialog' )
        self.show()


    def showDialog(self):
        text, ok = QInputDialog.getText( self, 'Input Dialog',
                                         'Enter your ID:' )

        if ok:
            self.string = str(text)
            self.identity()

    def identity(self):
        if re.search(r'[^0-9_a-zA-Z]', self.string) or (len(self.string) == 0):
            self.output.setText('no')
        else:
            self.output.setText('yes')



if __name__ == '__main__':

    app = QApplication(sys.argv)
    ex = Main_form()
    sys.exit(app.exec_())