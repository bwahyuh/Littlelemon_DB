# Import libraries
import mysql.connector
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

#Connect with mysql database
def connect_to_db():
    return mysql.connector.connect(
        host='localhost',
        user='root',
        password='root',
        database='Little_lemondb'
    )

def fetch_data(query):
    conn = connect_to_db()
    cursor = conn.cursor()
    cursor.execute(query)
    data = cursor.fetchall()
    columns = [desc[0] for desc in cursor.description]
    df = pd.DataFrame(data, columns=columns)
    cursor.close()
    conn.close()
    return df

def get_customers():
    query = "SELECT * FROM Customers;"
    return fetch_data(query)

def get_orders():
    query = "SELECT * FROM Orders;"
    return fetch_data(query)

def analyze_orders_by_customers():
    df_orders = get_orders()
    df_customers = get_customers()
    
    merged_df = df_orders.merge(df_customers, left_on='CustomerID', right_on='CustomerID')
    order_counts = merged_df.groupby('CustomerName')['OrderID'].count().reset_index()
    order_counts = order_counts.sort_values(by='OrderID', ascending=False)

  # Visualization
    plt.figure(figsize=(10, 6))
    sns.barplot(x='OrderID', y='CustomerName', data=order_counts, palette='Blues_r')
    plt.xlabel('Orders')
    plt.ylabel('Customer name')
    plt.title('Orders by customers')
    plt.show()

def analyze_sales_by_month():
    df_orders = get_orders()
    df_orders['OrderDate'] = pd.to_datetime(df_orders['OrderDate'])
    df_orders['Month'] = df_orders['OrderDate'].dt.strftime('%Y-%m')
    
    sales_by_month = df_orders.groupby('Month')['TotalAmount'].sum().reset_index()
    
    plt.figure(figsize=(12, 6))
    sns.lineplot(x='Month', y='TotalAmount', data=sales_by_month, marker='o', linestyle='-', color='blue')
    plt.xticks(rotation=45)
    plt.xlabel('Month')
    plt.ylabel('Total sales')
    plt.title('Total sales by month')
    plt.show()

def get_order_details():
    query = "SELECT * FROM OrderDetails;"
    return fetch_data(query)

def get_menu_items():
    query = "SELECT * FROM MenuItems;" 
    return fetch_data(query)

def analyze_top_dishes():
    order_details = get_order_details()
    menu_items = get_menu_items()

    merged = order_details.merge(menu_items, left_on='MenuItemID', right_on='MenuItemID')
    dish_counts = merged.groupby('ItemName')['Quantity'].sum().reset_index()
    dish_counts = dish_counts.sort_values(by='Quantity', ascending=False)

    # Visualization
    plt.figure(figsize=(10, 6))
    sns.barplot(data=dish_counts, x='Quantity', y='ItemName', palette='viridis')
    plt.title('Top dishes order')
    plt.xlabel('Quantity')
    plt.ylabel('Item name')
    plt.tight_layout()
    plt.show()

# Main function
if __name__ == "__main__":
    print("Analyzing orders by customers")
    analyze_orders_by_customers()

    print("Analyzing sales by month")
    analyze_sales_by_month()

    print("Analyzing top dishes")
    analyze_top_dishes()
