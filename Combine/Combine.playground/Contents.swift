import Foundation
import Combine

var anyCancellable = Set<AnyCancellable>()

struct Employee: Decodable {
    let id: String
}

struct Address: Decodable {
    let landmark: String
}

func fetchEmploye() -> AnyPublisher<Employee, Error> {
    URLSession.shared.dataTaskPublisher(for: URL(string: "https://www.com/employe")!)
        .map(\.data)
        .decode(type: Employee.self, decoder: JSONDecoder())
        .mapError({$0})
        .eraseToAnyPublisher()
}

func fetchAddress() -> AnyPublisher<Address, Error> {
    URLSession.shared.dataTaskPublisher(for: URL(string: "https://www.com/employe/adrress")!)
        .map(\.data)
        .decode(type: Address.self, decoder: JSONDecoder())
        .mapError({$0})
        .eraseToAnyPublisher()
}

@MainActor
func fetchData() {
    fetchEmploye()
        .zip(fetchAddress()) //
        .receive(on: DispatchQueue.main)
        .sink { error in
            print("error == \(error)")
        } receiveValue: { (employee, address) in
            print(employee.id)
            print(address.landmark)
        }.store(in: &anyCancellable)
    
    fetchAddress()
        .combineLatest(fetchEmploye())
        .sink(receiveCompletion: {print("\($0)")},
              receiveValue: { (address, employe) in
            print(address.landmark)
        })
        
    
    
}


