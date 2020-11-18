// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

contract SupplyChain
{   
    enum Status {Created, Delivering, Delivered, Accept, Declined}
    
    Order[] orders;
    
    // List of all orders
    mapping(address => uint256[]) public selfOrders;
    
    struct Order
    {
        string title;
        string description;
        address supplier;
        address deliveryCompany;
        address customer;
        
        Status status;
        
    }
    
    // status of order that is placed
    event OrderCreated(uint256 _index, address indexed deliveryCompany, address indexed customer);
    
    event OrderDelivering(uint256 _index, address indexed supplier, address indexed customer);
    
    event OrderDelivered(uint256 _index, address indexed supplier, address indexed customer);
    
    event OrderAccepted(uint256 _index, address indexed supplier, address indexed deliveryCompany);
    
    event OrderDeclined(uint256 _index, address indexed supplier, address indexed deliveryCompany);
    
    
    modifier onlyOrderDeliveringCompany(uint256 _index) {
        require(orders[_index].deliveryCompany == msg.sender);
        _;
    }
    
    modifier onlyCustomer(uint256 _index) {
        require(orders[_index].customer == msg.sender);
        _;
    }
    
    modifier orderCreated(uint256 _index) {
        require(orders[_index].status == Status.Created);
        _;
    }
    
    modifier orderDelivering(uint256 _index) {
        require(orders[_index].status == Status.Delivering);
        _;
    }
    
    modifier orderDelivered(uint256 _index) {
        require(orders[_index].status == Status.Delivered);
        _;
    }
    
    function getOrdersLength() public view returns (uint256) 
    {
        return orders.length;
    }
    
    function getOrder(uint256 _index) public view returns (string memory, string memory, address, address, address, Status)
    {
        Order memory order = orders[_index];
        return (order.title, order.description, order.supplier, order.deliveryCompany, order.customer, order.status);
    }
    
    function getSelfOrdersLength(address _address) public view returns(uint256)
    {
        return selfOrders[_address].length; 
    }
    
    function createOrder(string memory _title, string memory _description, address _deliveringCompany, address _customer) public 
    {
        Order memory order = Order({
          title: _title,
          description: _description,
          supplier: msg.sender,
          deliveryCompany: _deliveringCompany,
          customer: _customer,
          status: Status.Created
        });
        
        uint256 index = orders.length;
        emit OrderCreated(index, _deliveringCompany, _customer);
        orders.push(order);
        selfOrders[msg.sender].push(index);
        selfOrders[_deliveringCompany].push(index);
        selfOrders[_customer].push(index);
    }
    
    function startDeliveryOrder(uint256 _index) public onlyOrderDeliveringCompany(_index) orderCreated(_index)
    {
        Order storage order = orders[_index];
        emit OrderDelivering(_index, order.supplier, order.customer);
        order.status = Status.Delivering;
    }
    
    function stopDeliveringOrder(uint256 _index) public onlyOrderDeliveringCompany(_index) orderDelivering(_index)
    {
        Order storage order = orders[_index];
        emit OrderDelivering(_index, order.supplier, order.customer);
        order.status = Status.Delivered;
    }
    
    function acceptOrder(uint256 _index) public onlyCustomer(_index) orderDelivered(_index)
    {
        Order storage order = orders[_index];
        emit OrderAccepted(_index, order.supplier, order.deliveryCompany);
        orders[_index].status = Status.Accept;
    }
    
    function declineOrder(uint256 _index) public onlyCustomer(_index) orderDelivered(_index)
    {
        Order storage order = orders[_index];
        emit OrderDeclined(_index, order.supplier, order.deliveryCompany);
        orders[_index].status = Status.Declined;
    }
    
}