# Oystercard Challenge

## User stories

``` 
In order to use public transport
As a customer
I want money on my card
```
Class | Methods
------------ | -------------
Oystercard | balance 

```
In order to keep using public transport
As a customer
I want to add money to my card
```
Class | Methods
------------ | -------------
Oystercard | top_up(amount)

```
In order to protect my money from theft or loss
As a customer
I want a maximum limit (of £90) on my card
```
Class | Methods | Constants
------------ | ------------- | -------------
Oystercard | n/a | MAX_LIMIT
```
In order to pay for my journey
As a customer
I need my fare deducted from my card
```
Class | Methods
------------ | -------------
Oystercard | deduct(amount)
```
In order to get through the barriers.
As a customer
I need to touch in and out.
```
Class | Methods | Variables
------------ | ------------- | -------------
Oystercard | touch_in, touch_out, in_journey? | in_use

``` 
In order to pay for my journey
As a customer
I need to have the minimum amount (£1) for a single journey.
```
Class | Methods | Constants
------------ | ------------- | -------------
Oystercard | n/a | MIN_LIMIT
```
In order to pay for my journey
As a customer
When my journey is complete, I need the correct amount deducted from my card
```
Class | Constants
------------ | -------------
Oystercard | MIN_CHARGE

