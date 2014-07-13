function matXml(everyFrame,xmlName)

    %Create the document node and root element, toc:
    docNode = com.mathworks.xml.XMLUtils.createDocument('DetectedBB');
    lastFrame = 0;
    for i = 1 : size(everyFrame)
        if lastFrame == 0
            lastFrame = everyFrame(i,1);
            frame_node = docNode.createElement('frame');
            frame_node.setAttribute('number',num2str(everyFrame(i,1)));
            docNode.getDocumentElement.appendChild(frame_node);
            xmlwrite(docNode); 
        elseif (lastFrame ~= everyFrame(i,1))
            frame_node = docNode.createElement('frame');
            frame_node.setAttribute('number',num2str(everyFrame(i,1)));
            docNode.getDocumentElement.appendChild(frame_node);
            xmlwrite(docNode); 
        end
        
            
        bb_node = docNode.createElement('boudningBox');
        bb_node.setAttribute('id',num2str(everyFrame(i,2)));
        frame_node.appendChild(bb_node);

        x_element = docNode.createElement('x1');
        x_value = docNode.createTextNode('100');
        x_element.appendChild(x_value);
        bb_node.appendChild(x_element);

        y_element = docNode.createElement('y1');
        y_value = docNode.createTextNode('200');
        y_element.appendChild(y_value);
        bb_node.appendChild(y_element);

    end
    
	xmlwrite(strcat(xmlName,'.xml'),docNode);
	%type('info.xml');

end