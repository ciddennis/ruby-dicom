#    Copyright 2010 Christoffer Lervag

# This is a mix-in module which contains methods that are common among the different element types: Data, Item and Sequence.
module Elements

    # Accessible element variables:
    attr_reader :bin, :length, :name, :parent, :tag, :value, :vr

    # Returns the entire chain of parents in an array, where the first element is the
    # immediate parent and the last element is the top parent.
    # If no parents exist, an empty array is returned.
    def parents
      all_parents = Array.new
      # Extract all parents and add to array recursively:
      if parent
        all_parents = parent.parents if parent.parent
        all_parents.insert(0, parent)
      end
      return all_parents
    end

    # Set the parent of this element to a referenced element.
    def parent=(new_parent)
      # No testing for parent validity at the moment:
      @parent = new_parent
    end

end # of module