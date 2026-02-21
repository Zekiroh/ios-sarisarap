import SwiftUI

struct ReceiptView: View {
    let customerName: String
    let address: String
    let notes: String
    let items: [CartItem]
    let totalPrice: Double

    @Environment(\.dismiss) var dismiss   // for going back

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {

                // Top confirmation section
                VStack(spacing: 6) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.sariPrimary)

                    Text("Order Placed!")
                        .font(.title.bold())
                        .foregroundColor(.sariText)

                    Text("Thank you, \(customerName)!")
                        .font(.subheadline)
                        .foregroundColor(.sariText.opacity(0.7))
                }
                .padding(.top, 20)

                // Items + total
                VStack(alignment: .leading, spacing: 14) {

                    Text("Order Summary")
                        .font(.headline)
                        .foregroundColor(.sariText)

                    ForEach(items) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.food.name)
                                    .font(.subheadline)
                                    .foregroundColor(.sariText)

                                Text("x\(item.quantity)")
                                    .font(.caption)
                                    .foregroundColor(.sariText.opacity(0.7))
                            }

                            Spacer()

                            Text("₱\(Int(item.food.price * Double(item.quantity)))")
                                .font(.subheadline.bold())
                                .foregroundColor(.sariText)
                        }
                    }

                    Divider()

                    HStack {
                        Text("Total")
                            .font(.headline)
                            .foregroundColor(.sariText)

                        Spacer()

                        Text("₱\(Int(totalPrice))")
                            .font(.title3.bold())
                            .foregroundColor(.sariText)
                    }
                }
                .padding()
                .background(Color.sariCard)
                .cornerRadius(16)

                // Delivery info
                VStack(alignment: .leading, spacing: 10) {
                    Text("Delivery Details")
                        .font(.headline)
                        .foregroundColor(.sariText)

                    Text(address)
                        .foregroundColor(.sariText)

                    if !notes.isEmpty {
                        Text("Notes: \(notes)")
                            .foregroundColor(.sariText.opacity(0.7))
                    }
                }
                .padding()
                .background(Color.sariCard)
                .cornerRadius(16)

                // Button to go back
                Button {
                    dismiss()
                } label: {
                    Text("Back to Home")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.sariPrimary)
                        .cornerRadius(16)
                }
                .padding(.bottom, 40)
            }
            .padding()
        }
        .background(Color.sariBackground.ignoresSafeArea())
        .navigationTitle("Receipt")
    }
}
