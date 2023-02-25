package org.appfuse.client;

import java.util.ArrayList;
import java.util.List;

import org.appfuse.client.widget.BulletList;
import org.appfuse.client.widget.ListItem;
import org.appfuse.client.widget.Paragraph;
import org.appfuse.client.widget.Span;

import com.extjs.gxt.ui.client.data.ModelData;
import com.google.gwt.core.client.GWT;
import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.event.dom.client.KeyCodes;
import com.google.gwt.event.dom.client.KeyDownEvent;
import com.google.gwt.event.dom.client.KeyDownHandler;
import com.google.gwt.event.logical.shared.SelectionEvent;
import com.google.gwt.event.logical.shared.SelectionHandler;
import com.google.gwt.http.client.RequestBuilder;
import com.google.gwt.http.client.RequestCallback;
import com.google.gwt.http.client.RequestException;
import com.google.gwt.http.client.Request;
import com.google.gwt.http.client.Response;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.ui.Composite;
import com.google.gwt.user.client.ui.FlowPanel;
import com.google.gwt.user.client.ui.MultiWordSuggestOracle;
import com.google.gwt.user.client.ui.SuggestBox;
import com.google.gwt.user.client.ui.SuggestOracle;
import com.google.gwt.user.client.ui.SuggestOracle.Suggestion;
import com.google.gwt.user.client.ui.TextBox;
import com.hierarchycm.gxt.client.commands.ErrorHandlingAsyncCallback;
import com.hierarchycm.gxt.client.commands.GetInstanceHierarchyCommand;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;
import com.hierarchycm.gxt.client.viewers.ObjectInstanceViewerPanel;

public class InputListWidget extends Composite {
    List<String> itemsSelected = new ArrayList<String>();

    ArrayList <Suggestion> suggestions = getAlSuggestion();

    private MySuggestOracle getSuggestions() {
        return new MySuggestOracle();
    }

    public class MySuggestion implements Suggestion {

        private String value;
        private String name;

        MySuggestion (String name, String value) {
            this.name = name;
            this.value = value;
        }

        @Override
        public String getDisplayString() {
            // TODO Auto-generated method stub
            return name;
        }

        @Override
        public String getReplacementString() {
            // TODO Auto-generated method stub
            return value;
        }

    }


    private ArrayList <Suggestion> getAlSuggestion() {
        // TODO Auto-generated method stub
        ArrayList <Suggestion> oracle = new ArrayList<Suggestion>();

        oracle.add(new MySuggestion("Amy Kesic","1"));
        oracle.add(new MySuggestion("Jason Weston","1"));
        oracle.add(new MySuggestion("Dave Johnson","1"));
        oracle.add(new MySuggestion("Paul Hammant","1"));
        oracle.add(new MySuggestion("Jesse Kuhnert","1"));
        oracle.add(new MySuggestion("Ben Alex","1"));
        oracle.add(new MySuggestion("Tom Bender","1"));
        oracle.add(new MySuggestion("Alexandru Popescu","1"));
        oracle.add(new MySuggestion("Kaveh Arabfakhry","1"));
        oracle.add(new MySuggestion("Steven Hong","1"));
        oracle.add(new MySuggestion("Jason van Zyl","1"));
        oracle.add(new MySuggestion("Alex Vauthey","1"));
        oracle.add(new MySuggestion("Kiran Karnati","1"));
        oracle.add(new MySuggestion("Kalpana Nagireddy","1"));
        oracle.add(new MySuggestion("Ramnivas Laddad","1"));
        oracle.add(new MySuggestion("ArjŽ Cahn","1"));
        oracle.add(new MySuggestion("Amy Anne Rasberry","1"));
        oracle.add(new MySuggestion("Vincent Stoessel","1"));
        oracle.add(new MySuggestion("Steven Leija","1"));
        oracle.add(new MySuggestion("Brian Burke","1"));
        oracle.add(new MySuggestion("John Ipson","1"));
        oracle.add(new MySuggestion("Candy Chastain Mielke","1"));
        oracle.add(new MySuggestion("Scott Mark","1"));
        oracle.add(new MySuggestion("Dov B. Katz","1"));
        oracle.add(new MySuggestion("Alef Arendsen","1"));
        oracle.add(new MySuggestion("David Jencks","1"));
        oracle.add(new MySuggestion("Alexey Belikov","1"));
        oracle.add(new MySuggestion("Bryan Vial","1"));
        oracle.add(new MySuggestion("Dror Bereznitsky","1"));
        oracle.add(new MySuggestion("David Moskowitz","1"));
        oracle.add(new MySuggestion("Oscar Chan","1"));
        oracle.add(new MySuggestion("Sergey Sundukovskiy","1"));
        oracle.add(new MySuggestion("John Newton","1"));
        oracle.add(new MySuggestion("Chris Buzzetta","1"));
        oracle.add(new MySuggestion("Peter Svensson","1"));
        oracle.add(new MySuggestion("Riccardo Ferretti","1"));
        oracle.add(new MySuggestion("Christian Parker","1"));
        oracle.add(new MySuggestion("Ann (Jaksa) Skaehill","1"));
        oracle.add(new MySuggestion("Justin Blue","1"));
        oracle.add(new MySuggestion("Sean Dawson","1"));
        oracle.add(new MySuggestion("Devaraj NS","1"));
        oracle.add(new MySuggestion("Robert Gadd","1"));
        oracle.add(new MySuggestion("Diego Campodonico","1"));
        oracle.add(new MySuggestion("Bryan Field-Elliot","1"));
        oracle.add(new MySuggestion("Scott Delap","1"));
        oracle.add(new MySuggestion("Kevin Koster","1"));
        oracle.add(new MySuggestion("Fernand Galiana","1"));
        oracle.add(new MySuggestion("Christopher Shuler","1"));
        oracle.add(new MySuggestion("Geir Magnusson Jr","1"));
        oracle.add(new MySuggestion("Tyler Hansen","1"));
        oracle.add(new MySuggestion("Olivier Lamy","1"));
        oracle.add(new MySuggestion("J. Thomas Richardson","1"));
        oracle.add(new MySuggestion("Russell Beattie","1"));
        oracle.add(new MySuggestion("Martin Ouellet","1"));
        oracle.add(new MySuggestion("Scott Ferguson","1"));
        oracle.add(new MySuggestion("Guillaume Laforge","1"));
        oracle.add(new MySuggestion("Eric Weidner","1"));
        oracle.add(new MySuggestion("Troy McKinnon","1"));
        oracle.add(new MySuggestion("Max Hays","1"));
        oracle.add(new MySuggestion("Phillip Rhodes","1"));
        oracle.add(new MySuggestion("Eugene Kulechov","1"));
        oracle.add(new MySuggestion("Bob Johnson","1"));
        oracle.add(new MySuggestion("Richard Tucker, PMP","1"));
        oracle.add(new MySuggestion("Mats Henricson","1"));
        oracle.add(new MySuggestion("Floyd Marinescu","1"));
        oracle.add(new MySuggestion("Ed Burns","1"));
        oracle.add(new MySuggestion("Michael Root","1"));
        oracle.add(new MySuggestion("Dana Busch","1"));
        oracle.add(new MySuggestion("Borislav Roussev","1"));
        oracle.add(new MySuggestion("Harris Tsim","1"));
        oracle.add(new MySuggestion("Jason Thrasher","1"));
        oracle.add(new MySuggestion("Soo-il Kim","1"));
        oracle.add(new MySuggestion("Lindsey Bowman","1"));
        oracle.add(new MySuggestion("Ganesh Hariharan","1"));
        oracle.add(new MySuggestion("Judy Herilla","1"));
        oracle.add(new MySuggestion("Jevgeni Kabanov","1"));
        oracle.add(new MySuggestion("Craig Whitacre","1"));
        oracle.add(new MySuggestion("Paul M. Garvey","1"));
        oracle.add(new MySuggestion("Jeremy Whitlock","1"));
        oracle.add(new MySuggestion("Fabrizio Giustina","1"));
        oracle.add(new MySuggestion("Todd Fredrich","1"));
        oracle.add(new MySuggestion("Matt Stine","1"));
        oracle.add(new MySuggestion("Jo‹o Vitor Lacerda Guimar‹es","1"));
        oracle.add(new MySuggestion("Yassine Hinnach","1"));
        oracle.add(new MySuggestion("Chris Huston","1"));
        oracle.add(new MySuggestion("Jodi Behrens-Stark","1"));
        oracle.add(new MySuggestion("John Greenhill","1"));
        oracle.add(new MySuggestion("Roy Porter","1"));
        oracle.add(new MySuggestion("Paul Tuckey","1"));
        oracle.add(new MySuggestion("Arjun Ram","1"));
        oracle.add(new MySuggestion("Merrill Bennett","1"));
        oracle.add(new MySuggestion("James Richards","1"));
        oracle.add(new MySuggestion("Franz Garsombke","1"));
        oracle.add(new MySuggestion("Kimberly Horan","1"));
        oracle.add(new MySuggestion("Hani Suleiman","1"));
        oracle.add(new MySuggestion("Thomas Dudziak","1"));
        oracle.add(new MySuggestion("Andrew Penrose","1"));
        oracle.add(new MySuggestion("Igor Polyakov","1"));
        oracle.add(new MySuggestion("Steve Runkel","1"));

        return oracle;
    }

    public void setWidth(int width) {
        //super.setWidth(width+"px");
        //list.setWidth(width+"px");
        panel.setWidth(width+"px");
        //panel.setWidth("100%");
        //itemBox.setWidth(width+"px");
        //Window.alert("Setting width to" + width);
    }

    public void setWidth(String width) {
        super.setWidth(width);
        list.setWidth(width);
        panel.setWidth(width);
        itemBox.setWidth(width);
        Window.alert("Setting width to" + width);
    }

    final BulletList list;
    FlowPanel panel;
    final TextBox itemBox;

    public InputListWidget(int width) {

        panel = new FlowPanel();
        initWidget(panel);
        // 2. Show the following element structure and set the last <div> to display: block
        /*
        <ul class="token-input-list-facebook">
            <li class="token-input-input-token-facebook">
                <input type="text" style="outline-color: -moz-use-text-color; outline-style: none; outline-width: medium;"/>
            </li>
        </ul>
        <div class="token-input-dropdown-facebook" style="display: none;"/>
         */
        list = new BulletList();
        list.setStyleName("token-input-list-facebook");
        final ListItem item = new ListItem();
        item.setStyleName("token-input-input-token-facebook");
        itemBox = new TextBox();
        itemBox.getElement().setAttribute("style", "outline-color: -moz-use-text-color; outline-style: none; outline-width: medium;");
        final SuggestBox box = new SuggestBox(getSuggestions(), itemBox, new CustomSuggestionDisplay());

        box.getElement().setId("suggestion_box");
        item.add(box);
        list.add(item);

        // this needs to be on the itemBox rather than box, or backspace will get executed twice
        itemBox.addKeyDownHandler(new KeyDownHandler() {
            public void onKeyDown(KeyDownEvent event) {
                if (event.getNativeKeyCode() == KeyCodes.KEY_ENTER) {
                    // only allow manual entries with @ signs (assumed email addresses)
                    if (itemBox.getValue().contains("@"))
                        deselectItem(itemBox, list);
                }
                // handle backspace
                if (event.getNativeKeyCode() == KeyCodes.KEY_BACKSPACE) {
                    if ("".equals(itemBox.getValue().trim())) {
                        ListItem li = (ListItem) list.getWidget(list.getWidgetCount() - 2);
                        Paragraph p = (Paragraph) li.getWidget(0);
                        if (itemsSelected.contains(p.getText())) {
                            itemsSelected.remove(p.getText());
                            GWT.log("Removing selected item '" + p.getText() + "'", null);
                            GWT.log("Remaining: " + itemsSelected, null);
                        }
                        list.remove(li);
                        itemBox.setFocus(true);
                    }
                }
            }
        });

        box.addSelectionHandler(new SelectionHandler<SuggestOracle.Suggestion>() {
            public void onSelection(SelectionEvent selectionEvent) {
                MySuggestion mySuggestion = (MySuggestion)selectionEvent.getSelectedItem();
                //Window.alert(mySuggestion.getDisplayString());
                deselectItem(itemBox, list);
            }
        });

        setWidth(width);
        //setWidth("100%");

        panel.add(list);

        panel.getElement().setAttribute("onclick", "document.getElementById('suggestion_box').focus()");
        box.setFocus(true);
    }

    private void deselectItem(final TextBox itemBox, final BulletList list) {
        if (itemBox.getValue() != null && !"".equals(itemBox.getValue().trim())) {
            /** Change to the following structure:
             * <li class="token-input-token-facebook">
             * <p>What's New Scooby-Doo?</p>
             * <span class="token-input-delete-token-facebook">x</span>
             * </li>
             */

            final ListItem displayItem = new ListItem();
            displayItem.setStyleName("token-input-token-facebook");
            Paragraph p = new Paragraph(itemBox.getValue());

            displayItem.addClickHandler(new ClickHandler() {
                public void onClick(ClickEvent clickEvent) {
                    displayItem.addStyleName("token-input-selected-token-facebook");
                }
            });

            /** TODO: Figure out how to select item and allow deleting with backspace key
             displayItem.addKeyDownHandler(new KeyDownHandler() {
             public void onKeyDown(KeyDownEvent event) {
             if (event.getNativeKeyCode() == KeyCodes.KEY_BACKSPACE) {
             removeListItem(displayItem, list);
             }
             }
             });
             displayItem.addBlurHandler(new BlurHandler() {
             public void onBlur(BlurEvent blurEvent) {
             displayItem.removeStyleName("token-input-selected-token-facebook");
             }
             });
             */

            Span span = new Span("x");
            span.addClickHandler(new ClickHandler() {
                public void onClick(ClickEvent clickEvent) {
                    removeListItem(displayItem, list);
                }
            });

            displayItem.add(p);
            displayItem.add(span);
            // hold the original value of the item selected

            GWT.log("Adding selected item '" + itemBox.getValue() + "'", null);
            itemsSelected.add(itemBox.getValue());
            GWT.log("Total: " + itemsSelected, null);

            list.insert(displayItem, list.getWidgetCount() - 1);
            itemBox.setValue("");
            itemBox.setFocus(true);
        }
    }

    private void removeListItem(ListItem displayItem, BulletList list) {
        GWT.log("Removing: " + displayItem.getWidget(0).getElement().getInnerHTML(), null);
        itemsSelected.remove(displayItem.getWidget(0).getElement().getInnerHTML());
        list.remove(displayItem);
    }

    public class MySuggestOracle extends SuggestOracle {

        @Override
        public void requestSuggestions(final SuggestOracle.Request suggestRequest,
                                       final SuggestOracle.Callback callback)
        {


            AsyncCallback <ObjectTypeTree> instHeirCallback = new ErrorHandlingAsyncCallback<ObjectTypeTree>() {
                @Override
                public void onSuccess(ObjectTypeTree result) {

                    SuggestOracle.Response r = new SuggestOracle.Response();

                    suggestions = new ArrayList <Suggestion>();
                    for (ModelData item : ((ObjectTypeTree)result.getChild(0)).getChildren()) {

                        ObjectTypeTree ott = (ObjectTypeTree)item;
                        suggestions.add(new MySuggestion(ott.getObjInstance().instanceName, ott.getObjInstance().instanceName));
                    }
                    r.setSuggestions(suggestions);
                    callback.onSuggestionsReady(suggestRequest, r);
//					  callback.onSuggestionsReady(suggestRequest, r);

                }
            };

            GetInstanceHierarchyCommand instHierCommand = new GetInstanceHierarchyCommand(instHeirCallback);
            String objInstLinkId = "287";
            int depth = 2;
            String filterType = "1";

            instHierCommand.execute(objInstLinkId, depth, filterType);

        }
    }
}
