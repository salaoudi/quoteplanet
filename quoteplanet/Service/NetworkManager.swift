

import Foundation

class NetworkManager {

	enum ManagerErrors: Error {
		case invalidResponse
		case invalidStatusCode(Int)
	}

	
	enum HttpMethod: String {
		case get
		case post

		var method: String { rawValue.uppercased() }
	}

	
	func request<T: Decodable>(fromURL url: URL, httpMethod: HttpMethod = .get, completion: @escaping (Result<T, Error>) -> Void) {
		
		let complete: (Result<T, Error>) -> Void = { result in
			DispatchQueue.main.async {
				completion(result)
			}
		}

		
		var request = URLRequest(url: url)
		request.httpMethod = httpMethod.method

		let session = URLSession.shared.dataTask(with: request) { data, response, error in
			
			if let error = error {
				complete(.failure(error))
				return
			}

		
			guard let urlResponse = response as? HTTPURLResponse else { return complete(.failure(ManagerErrors.invalidResponse)) }
			if !(200..<300).contains(urlResponse.statusCode) {
				return complete(.failure(ManagerErrors.invalidStatusCode(urlResponse.statusCode)))
			}

			
			guard let data = data else { return }
			do {
				let all = try JSONDecoder().decode(T.self, from: data)
				complete(.success(all))
			} catch {
				print("Could not translate the data to the requested type. Reason: \(error.localizedDescription)")
				complete(.failure(error))
			}
		}

		
		session.resume()
	}
}
