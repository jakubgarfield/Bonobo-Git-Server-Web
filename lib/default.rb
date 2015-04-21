# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

Encoding.default_internal = Encoding::UTF_8
Encoding.default_external = Encoding::UTF_8

include Nanoc3::Helpers::Tagging
include Nanoc3::Helpers::Rendering
include Nanoc3::Helpers::LinkTo


def menu_link_to(text, target, attributes={})
    # Find path
    if target.is_a?(String)
        path = target
    else
        path = target.path
        raise RuntimeError, "Cannot create a link to #{target.inspect} because this target is not outputted (its routing rule returns nil)" if path.nil?
    end

    # Join attributes
    attributes = attributes.inject('') do |memo, (key, value)|
        memo + key.to_s + '="' + h(value) + '" '
    end
    
    if @item_rep && @item_rep.path == path
         "<li class=\"active\"><a #{attributes}href=\"#{h path}\">#{text}</a></li>"
    else
        "<li><a #{attributes}href=\"#{h path}\">#{text}</a></li>"
    end
end

