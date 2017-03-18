class CargoTrain < Train

  TYPE_TRAIN      = :cargo

protected

def wagon_type
  CargoWagon
end

end
