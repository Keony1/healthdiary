abstract class FailureChat implements Exception {}

class InvalidTextError implements FailureChat {}

class InvalidReturnError implements FailureChat {}
