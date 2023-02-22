package org.appfuse.client;

import com.google.gwt.user.client.ui.SuggestBox.DefaultSuggestionDisplay;
import com.google.gwt.user.client.ui.Widget;

public class CustomSuggestionDisplay extends DefaultSuggestionDisplay {
 @Override
 protected Widget decorateSuggestionList (Widget suggestionList){	
	 Widget suggestionListPrepped = super.decorateSuggestionList(suggestionList);
	 suggestionListPrepped.setStyleName("suggestionPopup");
	 return suggestionListPrepped;	 
 }
}
