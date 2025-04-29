const PRODUCTOS_DESTACADOS = [
  {
    id: 1,
    titulo: "Smartphone XYZ última generación",
    precio: 599.99,
    estado: "nuevo",
    imagen: "https://via.placeholder.com/300",
    vendedor: { nombre: "TechStore", tipo: "oficial" },
    envio_gratis: true,
    categoria_id: 1
  },
  {
    id: 2,
    titulo: "Laptop Ultradelgada 15.6 pulgadas",
    precio: 899.99,
    estado: "nuevo",
    imagen: "https://via.placeholder.com/300",
    vendedor: { nombre: "ComputerWorld", tipo: "oficial" },
    envio_gratis: true,
    categoria_id: 1
  },
  {
    id: 3,
    titulo: "Zapatillas deportivas Running Pro",
    precio: 79.99,
    estado: "nuevo",
    imagen: "https://via.placeholder.com/300",
    vendedor: { nombre: "SportShop", tipo: "personal" },
    envio_gratis: false,
    categoria_id: 3
  },
  {
    id: 4,
    titulo: "Set de sartenes antiadherentes",
    precio: 45.50,
    estado: "nuevo",
    imagen: "https://via.placeholder.com/300",
    vendedor: { nombre: "HomeSupplies", tipo: "oficial" },
    envio_gratis: true,
    categoria_id: 2
  },
  {
    id: 5,
    titulo: "Consola de videojuegos (usado)",
    precio: 199.99,
    estado: "usado",
    imagen: "https://via.placeholder.com/300",
    vendedor: { nombre: "GamersUnited", tipo: "personal" },
    envio_gratis: false,
    categoria_id: 1
  }
];

export default PRODUCTOS_DESTACADOS;
