<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>React Functional</title>
    <script src="react-dev.js"></script>
    <script src="react-dom.js"></script>
    <script src="https://unpkg.com/@babel/standalone@7/babel.min.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
      body {
        font-family: sans-serif;
      }
    </style>
  </head>
  <body>
    <div id="AppComponent"></div>
 
    <script type="text/babel">
      const initialCheckoutForm = {
        first_name: '',
        last_name: '',
        phone_number: '',
        address: '',
        email: '',
        postal_code: '',
        city: 'Karachi',
        country: 'Pakistan',
        payment_method: 'Cash on Delivery',
        cart_details: [],
      };
 
      const products = [
        {
          id: 1,
          name: 'Water Bottle',
          description: 'Color: Blue, Size: Large',
          price: 100,
          discounted_price: 99,
        },
        {
          id: 2,
          name: 'Mouse',
          description: 'Wired USB Port',
          price: 250,
          discounted_price: 199,
        },
        {
          id: 3,
          name: 'Watch',
          description: 'Color: Black, Watch Type: Smart, Brand: Apple',
          price: 5000,
          discounted_price: 4999,
        },
        {
          id: 4,
          name: 'Infinix S23',
          description: 'Color: Blue, Storage: 120GB, RAM: 2GB, Display: 6x4',
          price: 25000,
          discounted_price: 24999,
        },
        {
          id: 5,
          name: 'Shoes',
          description: 'Size: 8, Color: Blue, Type: Sports Wear',
          price: 3000,
          discounted_price: 3000,
        },
      ];
 
      const ProductBox = ({ addToCart }) => {
        return (
          <div className="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-3 p-4">
            {products.map((product) => (
              <div
                key={product.id}
                className="bg-white text-black p-4 rounded-md shadow-2xl"
              >
                <h1 className="font-bold">{product.name}</h1>
                <p>{product.description}</p>
                {product.discounted_price < product.price ? (
                  <div className="text-pink-500">
                    <span className="text-red-600 line-through">{product.price}</span>{' '}
                    {product.discounted_price}
                  </div>
                ) : (
                  <div>{product.price}</div>
                )}
                <div className="mt-2">
                  <input type="number" id={`qty${product.id}`} defaultValue={1} />
                  <button
                    className="bg-pink-500 text-white px-4 py-2 rounded-lg ml-2"
                    onClick={() =>
                      addToCart(product.id, parseInt(document.getElementById(`qty${product.id}`).value))
                    }
                  >
                    Add to Cart
                  </button>
                </div>
              </div>
            ))}
          </div>
        );
      };
 
      const Application = () => {
        const [checkoutForm, setCheckoutForm] = React.useState(initialCheckoutForm);
 
        const addToCart = (productId, quantity) => {
          const product = products.find((p) => p.id === productId);
          const existingCartItem = checkoutForm.cart_details.find((item) => item.id === productId);
 
          const updatedCart = existingCartItem
            ? checkoutForm.cart_details.map((item) =>
                item.id === productId ? { ...item, quantity: item.quantity + quantity } : item
              )
            : [...checkoutForm.cart_details, { ...product, quantity }];
 
          setCheckoutForm({ ...checkoutForm, cart_details: updatedCart });
        };
 
        const removeFromCart = (productId) => {
          const updatedCart = checkoutForm.cart_details.filter((item) => item.id !== productId);
          setCheckoutForm({ ...checkoutForm, cart_details: updatedCart });
        };
 
        const handleInputChange = (e) => {
          const { name, value } = e.target;
          setCheckoutForm({ ...checkoutForm, [name]: value });
        };
 
        const submitCheckout = () => {
          alert(`Checkout successful!
Name: ${checkoutForm.first_name} ${checkoutForm.last_name}
Phone: ${checkoutForm.phone_number}
Email: ${checkoutForm.email}
City: ${checkoutForm.city}
Country: ${checkoutForm.country}
Payment: ${checkoutForm.payment_method}`);
 
          setCheckoutForm(initialCheckoutForm);
        };
 
        return (
          <>
            <div className="bg-pink-50 p-8">
              <h1 className="text-pink-500 text-6xl">Checkout</h1>
            </div>
 
            <div id="container" className="flex p-4">
              <div id="mainBox" className="w-full flex flex-wrap gap-4">
                <div id="checkoutForm" className="w-1/3 p-4 bg-white rounded-md shadow-md">
                  <h2 className="text-xl font-bold mb-4">Checkout Form</h2>
 
                  <input
                    type="text"
                    name="first_name"
                    value={checkoutForm.first_name}
                    onChange={handleInputChange}
                    placeholder="Enter your first name"
                    className="mb-2 p-2 border rounded"
                  />
                  <input
                    type="text"
                    name="last_name"
                    value={checkoutForm.last_name}
                    onChange={handleInputChange}
                    placeholder="Enter your last name"
                    className="mb-2 p-2 border rounded"
                  />
                  <input
                    type="tel"
                    name="phone_number"
                    value={checkoutForm.phone_number}
                    onChange={handleInputChange}
                    placeholder="Enter your phone number"
                    className="mb-2 p-2 border rounded"
                  />
                  <textarea
                    name="address"
                    value={checkoutForm.address}
                    onChange={handleInputChange}
                    placeholder="Enter your full address"
                    className="mb-2 p-2 border rounded w-full"
                  ></textarea>
                  <input
                    type="email"
                    name="email"
                    value={checkoutForm.email}
                    onChange={handleInputChange}
                    placeholder="Enter your email"
                    className="mb-2 p-2 border rounded"
                  />
                  <input
                    type="text"
                    name="postal_code"
                    value={checkoutForm.postal_code}
                    onChange={handleInputChange}
                    placeholder="Enter your postal code"
                    className="mb-2 p-2 border rounded"
                  />
                  <select
                    name="city"
                    value={checkoutForm.city}
                    onChange={handleInputChange}
                    className="mb-2 p-2 border rounded"
                  >
                    <option>Karachi</option>
                    <option>Lahore</option>
                    <option>Islamabad</option>
                    <option>Peshawar</option>
                    <option>Quetta</option>
                  </select>
                  <select
                    name="country"
                    value={checkoutForm.country}
                    onChange={handleInputChange}
                    className="mb-2 p-2 border rounded"
                  >
                    <option>Pakistan</option>
                  </select>
 
                  <div>
                    <label className="flex items-center gap-2">
                      <input
                        type="radio"
                        name="payment_method"
                        value="Cash on Delivery"
                        checked={checkoutForm.payment_method === 'Cash on Delivery'}
                        onChange={handleInputChange}
                      />
                      Cash on Delivery
                    </label>
                    <label className="flex items-center gap-2">
                      <input
                        type="radio"
                        name="payment_method"
                        value="Online Payment"
                        checked={checkoutForm.payment_method === 'Online Payment'}
                        onChange={handleInputChange}
                      />
                      Online Payment
                    </label>
                  </div>
                </div>
 
                <div id="main" className="w-2/3">
                  <ProductBox addToCart={addToCart} />
                </div>
              </div>
            </div>
 
            <div className="p-4">
              <h2 className="text-lg font-bold">Cart Details</h2>
              {checkoutForm.cart_details.length === 0 ? (
                <p>Your cart is empty.</p>
              ) : (
                <div>
                  {checkoutForm.cart_details.map((item) => (
                    <div key={item.id} className="bg-gray-100 p-2 mb-2">
                      <span>
                        {item.name} (Qty: {item.quantity})
                      </span>
                      <button
                        className="text-red-500 ml-4"
                        onClick={() => removeFromCart(item.id)}
                      >
                        Remove
                      </button>
                    </div>
                  ))}
                </div>
              )}
 
              {checkoutForm.cart_details.length > 0 && (
                <button
                  className="bg-green-500 text-white px-4 py-2 rounded-lg mt-4"
                  onClick={submitCheckout}
                >
                  Checkout
                </button>
              )}
            </div>
          </>
        );
      };
 
      const root = ReactDOM.createRoot(document.getElementById('AppComponent'));
      root.render(<Application />);
    </script>
  </body>
</html>