import ResponseHelper from "./response.helper.js"

const handleError = (err, res) => {
  const resData = new ResponseHelper()
  resData.sendError(res, err.message, err.statusCode, err.stack)
}

class BadRequestException extends Error {
  constructor(message = "Bad Request Exception", statusCode = 400) {
    super(message)
    this.statusCode = statusCode
  }
}

class ForbiddenException extends Error {
  constructor(message = "Forbidden Exception", statusCode = 403) {
    super(message)
    this.statusCode = statusCode
  }
}

export { handleError, BadRequestException, ForbiddenException }
