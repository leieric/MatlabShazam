function hashTable = hash(table)
    h = table(:,4).*(2^16) + table(:,1).*(2^8) + table(:,2);
    hashTable = [h table(:,3) table(:,5)];
end

