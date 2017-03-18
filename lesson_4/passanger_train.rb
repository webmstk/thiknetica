class PassangerTrain < Train

  TYPE_TRAIN  = :passanger

protected

def wagon_type
  PassangerWagon
end

end
