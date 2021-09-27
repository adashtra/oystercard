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
Oystercard | add_money

```
In order to protect my money from theft or loss
As a customer
I want a maximum limit (of £90) on my card
```
Class | Methods
------------ | -------------
Oystercard | maximum_limit 
```
In order to pay for my journey
As a customer
I need my fare deducted from my card
```
Class | Methods
------------ | -------------
Oystercard | deduct
```
In order to get through the barriers.
As a customer
I need to touch in and out.
```
Class | Methods
------------ | -------------
Oystercard | touch_in, touch_out, in_journey?

## Testing in IRB
First intialise object for example oystercard_1 = Oystercard.new
Second to check balance oystercard_1.check_balance

## 03 Learn debugging basics

1. Type of error: NameError:
  uninitialized constant Oystercard
2. File path where the error happened: # ./spec/oystercard_spec.rb:1:in `<top (required)>'
3. Line number of error: rb:1
4. Error: 'Raised when a given name is invalid or undefined.'