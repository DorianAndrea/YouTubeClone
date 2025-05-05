import Foundation

enum NetworkError:String,Error{
    case invalidURL
    case serializationFailed
    case generic
    case couldNotDecodeData
    case httpResponseError
    case statusCodeError = "Ocurrió un error al tratar de consultar el API: status code"
    case jsonDecoder = "Error al intentar extraer datos json"
    case unauthorized
}
