import logging

class Logger:
    def __init__(self, name, level=logging.INFO):
        self.logger = logging.getLogger(name)
        self.logger.setLevel(level)
        self.formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
        self.console_handler = logging.StreamHandler()
        self.console_handler.setFormatter(self.formatter)
        self.logger.addHandler(self.console_handler)

    def get_logger(self):
        return self.logger

    def set_level(self, level):
        self.logger.setLevel(level)

    def add_file_handler(self, file_path):
        file_handler = logging.FileHandler(file_path)
        file_handler.setFormatter(self.formatter)
        self.logger.addHandler(file_handler)