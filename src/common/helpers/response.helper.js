class ResponseHelper {
  constructor() {
    this.defaultMessages = {
      SUCCESS: "Operation was successful",
      ERROR: "Internal server error occurred",
      NOT_FOUND: "Resource not found",
      UNAUTHORIZED: "Unauthorized access",
    }
  }

  sendSuccess(
    res = null,
    metaData = null,
    message = this.defaultMessages.SUCCESS,
    statusCode = 200
  ) {
    const timestamp = new Date().toISOString()
    const response = {
      status: "success",
      statusCode,
      message,
      data: metaData,
      timestamp,
      path: res.req.originalUrl,
      documentation: "https://example.com/api/docs",
    }

    res.status(statusCode).json(response)
  }

  sendError(
    res,
    message = this.defaultMessages.ERROR,
    statusCode = 500,
    stack = null
  ) {
    const timestamp = new Date().toISOString()
    const response = {
      status: "error",
      statusCode,
      message,
      timestamp,
      path: res.req.originalUrl,
      ...(process.env.NODE_ENV !== "production" && { stack }),
    }

    res.status(statusCode).json(response)
  }
}

export default ResponseHelper
