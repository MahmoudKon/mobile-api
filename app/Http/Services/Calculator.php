<?php

namespace App\Http\Services;

class Calculator
{
    public float $quantity = 0;
    public float $price = 0;
    public float $total = 0;
    public float $net_price = 0;
    public float $water = 0;
    public float $protein = 0;
    public float $fats = 0;
    public float $water_discount = 0;
    public float $net_quantity = 0;
    public float $protein_bonus = 0;
    public float $fats_bonus = 0;

    public float $fee = 0;

    public function calculate()
    {
        $this->calculateWaterDiscount();
        $this->calculateNetQuantity();
        $this->calculateNetPrice();
        $this->calculateProteinBonus();
        $this->calculateFatsBonus();
        $this->calculateTotalPrice();
    }

    public function setQuantity($quantity)
    {
        $this->quantity = $quantity;
        return $this;
    }

    public function setWater($water)
    {
        $this->water = $water;
        return $this;
    }

    public function setProtein($protein)
    {
        $this->protein = $protein;
        return $this;
    }

    public function setFats($fats)
    {
        $this->fats = $fats;
        return $this;
    }

    public function setPrice($price)
    {
        $this->price = $price;
        return $this;
    }
    public function setFee($fee)
    {
        $this->fee = $fee;
        return $this;
    }

    public function calculateWaterDiscount()
    {
        $this->water_discount = $this->quantity * ($this->water / 100);

        return $this;
    }

    public function calculateNetQuantity()
    {
        $this->net_quantity = $this->quantity - $this->water_discount;

        return $this;
    }

    public function calculateNetPrice()
    {
        $this->net_price = $this->net_quantity * $this->price;

        return $this;
    }

    public function calculateProteinBonus()
    {
        $this->protein_bonus = $this->calculateBonus($this->protein, 3.20, ['min' => 3.00, 'max' => 3.10]);

        return $this;
    }

    public function calculateFatsBonus()
    {
        $this->fats_bonus = $this->calculateBonus($this->fats, 3.80, ['min' => 3.50, 'max' => 3.70]);

        return $this;
    }

    public function calculateTotalPrice()
    {
        $this->total = $this->fats_bonus + $this->protein_bonus + $this->net_price + $this->fee;

        return $this;
    }

    protected function calculateBonus(float $percentage, float $start, array $zeroRange)
    {
        $percentage = number_format($percentage, 2);
        $bonus = 0;
        $last_number = substr((string) $percentage, -1);
        $percentage -= $last_number * .01;
        $percentage = number_format($percentage, 1);

        if ( $percentage >= $zeroRange['min'] && $percentage < $start ) {
            $bonus = 0;
        } else if ( $percentage >= $start ) {
            $result = ($percentage - $zeroRange['max']) * 10;
            $bonus = ($result * .05);
            if ($last_number > 0 && $last_number <= 9) {
                $bonus += .025;
            }
        } else if ($percentage < 3.5 && $percentage >= 2.5) {
            $result = ($percentage - $zeroRange['min']) * 10;
            $bonus = ($result * .05);
            if ($last_number > 0 && $last_number <= 9) {
                $bonus -= .025;
            }
        }
        return number_format($bonus, 3) * $this->quantity * $this->price;
    }
}
