package org.sia.controller;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.math.BigInteger;
import java.util.List;

import org.apache.poi.xwpf.usermodel.ParagraphAlignment;
import org.apache.poi.xwpf.usermodel.UnderlinePatterns;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableCell;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTHeight;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTShd;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTString;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTblPr;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTcPr;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTrPr;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTVerticalJc;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STShd;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STVerticalJc;

import java.io.FileOutputStream;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import java.io.FileOutputStream;
import org.apache.poi.xwpf.usermodel.XWPFDocument;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.net.URL;
import java.util.ResourceBundle;
import javafx.fxml.Initializable;
import javafx.fxml.FXML;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javafx.event.ActionEvent;
import javafx.scene.control.ComboBox;
import javafx.stage.FileChooser;
import javafx.stage.FileChooser.ExtensionFilter;
import org.w3c.dom.NodeList;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.scene.control.ListView;

import javafx.scene.control.TableView;
import javafx.collections.ObservableList;
import javafx.scene.control.TableColumn;
import javafx.collections.FXCollections;
import javafx.collections.ListChangeListener;
import javafx.scene.control.TablePosition;
import javafx.scene.control.Button;
import javafx.scene.control.Alert;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.util.ArrayList;
import org.sia.model.Attribute;
import org.sia.model.DataDictonary;

import java.util.LinkedHashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.scene.control.ButtonType;
import org.apache.poi.xwpf.usermodel.Borders;
import org.sia.dao.AttributeDao;
import org.sia.dao.DataDictionaryDao;
import org.sia.dao.DataDictionaryAttributeDao;
import org.sia.dao.impl.AttributeDaoImplHibernate;
import org.sia.dao.impl.DataDictionaryDaoImplHibernate;
import org.sia.dao.impl.DataDictionaryAttributeDaoImplHibernate;
import org.sia.model.DataDictionaryAttribute;

public class UtamaController implements Initializable {

    @FXML
    private Button btnFile, btnTambah, btnDelete, btnReset, btnGenerate;
    @FXML
    private ComboBox cbDataType;
    @FXML
    private ListView listview;
    @FXML
    private TableView<Attribute> tableViewDD;
    @FXML
    private TextField tfLength, tfAlias, tfField, tfKode, tfNamaProses, tfRelasi, tfAktivitas, tfDokumen, tfAktor, tfKodeDataDictionary;
    @FXML
    private TextArea taDescription, tfDeskripsi;
    @FXML
    private TableColumn<Attribute, String> field, dataType, alias, length, description;

    private Attribute data = null;

    ObservableList<Attribute> items = FXCollections.observableArrayList();
    ObservableList<String> options = FXCollections.observableArrayList();
    ObservableList<Attribute> storedItems = FXCollections.observableArrayList();
    ArrayList<String> listDataObject = new ArrayList();

    Map<String, String> mapDataObject = new HashMap<>();
    Map<String, String> mapActivity = new HashMap<>();
    Map<String, String> mapTargetSource = new HashMap<>();
    Map<String, String> mapDataObjectActivity = new HashMap<>();
    Map<String, String> mapActor = new HashMap<>();
    Map<String, String> mapDataType = new HashMap<>();
    Map<String, String> mapDeskripsi = new HashMap<>();
    Map<String, Integer> mapStoredAttributes = new HashMap<>();
    Map<String, Integer> mapActorCoordinate = new HashMap<>();
    Map<String, Integer> mapActorCoordinateSorted = new LinkedHashMap<>();
    Map<String, Integer> mapDataObjectCoordinate = new HashMap<>();
    Map<String, String> mapDataDictionaries = new HashMap<>();

    private final AttributeDao attributeDao;
    private final DataDictionaryDao dataDictionaryDao;
    private final DataDictionaryAttributeDao dataDictonaryAttibuteDao;

    private String cellValue = "";

    public UtamaController() {
        tableViewDD = new TableView<>();
        attributeDao = new AttributeDaoImplHibernate();
        dataDictionaryDao = new DataDictionaryDaoImplHibernate();
        dataDictonaryAttibuteDao = new DataDictionaryAttributeDaoImplHibernate();
    }

    @FXML
    private void loadFileXml(ActionEvent event) throws JAXBException {
        try {
            FileChooser fc = new FileChooser();
            fc.setInitialDirectory(new File("E:\\data dictionary"));
            fc.getExtensionFilters().addAll(new ExtensionFilter("xml file", "*.xpdl"));
            File selectedFile = fc.showOpenDialog(null);
            if (selectedFile != null) {
                
                mapTargetSource.clear();
                listview.getItems().clear();
                listDataObject.clear();
                String splits[] = selectedFile.getName().split(".xpdl");
                tfKode.setText(splits[0]);
                DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
                DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
                Document doc = dBuilder.parse(selectedFile.getAbsolutePath());
                doc.getDocumentElement().normalize();
                NodeList nListActivity = doc.getElementsByTagName("Activity");
                NodeList nListAssociation = doc.getElementsByTagName("Association");
                NodeList nListDocumentation = doc.getElementsByTagName("Documentation");
                NodeList nListCoordinates = doc.getElementsByTagName("Coordinates");
                NodeList vendor = doc.getElementsByTagName("Vendor");
                String vendorString = null;
                for (int temp = 0; temp < vendor.getLength(); temp++) {
                    Node nNode = vendor.item(temp);
                    String target, source;
                    if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                        Element eElement = (Element) nNode;
                        vendorString = eElement.getTextContent();
                    }
                }
                if(vendorString.equalsIgnoreCase("Bizagi Process Modeler."))
                {
                for (int temp = 0; temp < nListAssociation.getLength(); temp++) {
                    Node nNode = nListAssociation.item(temp);
                    String target, source;
                    if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                        Element eElement = (Element) nNode;
                        target = eElement.getAttribute("Target");
                        source = eElement.getAttribute("Source");
                        mapTargetSource.put(source, target);
                    }
                }
                mapActivity.clear();
                for (int temp = 0; temp < nListActivity.getLength(); temp++) {
                    Node nNode = nListActivity.item(temp);
                    String name, id;
                    if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                        Element eElement = (Element) nNode;
                        name = eElement.getAttribute("Name");
                        id = eElement.getAttribute("Id");
                        mapActivity.put(id, name);
                    }
                }

                mapDataObject.clear();
                mapDataObjectCoordinate.clear();
                mapActorCoordinate.clear();
                listDataObject.clear();
                for (int temp = 0; temp < nListCoordinates.getLength(); temp++) {
                    Node nNode = nListCoordinates.item(temp);
                    String name, id;
                    if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                        Element eElement = (Element) nNode;
                        Element eElementParent = (Element) eElement.getParentNode().getParentNode().getParentNode();
                        name = eElementParent.getAttribute("Name");
                        id = eElementParent.getAttribute("Id");
                        if (eElementParent.getNodeName().equalsIgnoreCase("lane")) {
                            mapActorCoordinate.put(eElementParent.getAttribute("Name"), Integer.parseInt(eElement.getAttribute("YCoordinate")));
                        }
                        if (eElementParent.getNodeName().equalsIgnoreCase("DataObject")) {
                            mapDataObjectCoordinate.put(eElementParent.getAttribute("Name"), Integer.parseInt(eElement.getAttribute("YCoordinate")));
                            mapDataObject.put(id, name);
                            listDataObject.add(name);
                        }
                    }
                }

                int flag = 0;
                for (int temp = 0; temp < nListCoordinates.getLength(); temp++) {
                    Node nNode = nListCoordinates.item(temp);
                    if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                        Element eElement = (Element) nNode;
                        Element eElementParent = (Element) eElement.getParentNode().getParentNode().getParentNode();
                        if (eElementParent.getNodeName().equalsIgnoreCase("Pool")) {
                            flag++;
                            if (flag == 2) {
                                tfNamaProses.setText(eElementParent.getAttribute("Name"));
                            }
                            if (flag > 2) {
                                mapActorCoordinate.put(eElementParent.getAttribute("Name"), Integer.parseInt(eElement.getAttribute("YCoordinate")));
                            }
                        }

                    }
                }

                mapDeskripsi.clear();
                for (int temp = 0; temp < nListDocumentation.getLength(); temp++) {
                    Node nNode = nListDocumentation.item(temp);
                    if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                        Element eElement = (Element) nNode;
                        Element eElement2 = (Element) eElement.getParentNode().getParentNode();
                        if (eElement2.getAttribute("Name").equalsIgnoreCase(mapDataObject.get(eElement2.getAttribute("Id")))) {
                            String string = eElement.getTextContent();
                            String[] split = string.split("#");

                            String atributes = "";
                            for (int j = 0; j < split.length; j++) {
                                if (j == 0 || j == 1 || j > split.length - 2) {
                                } else {
                                    atributes = atributes + "#" + split[j];
                                }
                                mapDeskripsi.put(eElement2.getAttribute("Name"), atributes);
                            }
                        }
                    }
                }

                loadListView(listDataObject);
                
                            }
            else
            {
                Alert test = new Alert(Alert.AlertType.WARNING);
                test.setTitle("Notification");
                test.setHeaderText("Gagal digenerate!");
                String message = "File XML tidak sesuai!";
                test.setContentText(message);
                test.showAndWait();
            }

            } else {
                System.out.println("file is not valid");
            }

        } catch (Exception e) {
            System.out.println(e.toString());
        }

        int flag1 = 0;
        int flag2 = 0;
        int id = 0;

        mapActorCoordinateSorted.clear();
        mapActorCoordinate.entrySet().stream()
                .sorted(Map.Entry.<String, Integer>comparingByValue().reversed())
                .forEachOrdered(x -> mapActorCoordinateSorted.put(x.getKey(), x.getValue()));

        mapActor.clear();
        for (Map.Entry<String, Integer> entry : mapDataObjectCoordinate.entrySet()) {
            int coordinate = entry.getValue();
            for (Map.Entry<String, Integer> entry2 : mapActorCoordinateSorted.entrySet()) {
                if (id == 0) {
                    flag1 = entry2.getValue();
                    flag2 = flag1 * flag1;
                } else {
                    flag1 = entry2.getValue();
                }
                if (coordinate >= flag1 && coordinate <= flag2) {
                    mapActor.put(entry.getKey(), entry2.getKey());
                }
                id++;
                flag2 = flag1;
            }
            id = 0;
            flag1 = 0;
            flag2 = 0;
        }

        for (Map.Entry<String, String> entry : mapTargetSource.entrySet()) {
            for (Map.Entry<String, String> entry2 : mapDataObject.entrySet()) {
                if (entry2.getKey().equalsIgnoreCase(entry.getValue())) {
                    mapTargetSource.replace(entry.getKey(), entry.getValue(), entry2.getValue());
                }
            }
        }
        mapDataObjectActivity.clear();
        for (Map.Entry<String, String> entry : mapTargetSource.entrySet()) {
            for (Map.Entry<String, String> entry2 : mapActivity.entrySet()) {
                if (entry2.getKey().equalsIgnoreCase(entry.getKey())) {
                    mapDataObjectActivity.put(entry.getValue(), entry2.getValue());
                }
            }
        }
    }

    private void loadListView(ArrayList<String> datas) {
        datas.forEach((data) -> {
            listview.getItems().add(data);
        });
    }

    private void read() {
        storedItems.clear();
        mapStoredAttributes.clear();
        mapDataDictionaries.clear();

        for (Attribute attribute : attributeDao.getAllAttributes()) {
            storedItems.add(attribute);
            mapStoredAttributes.put(attribute.getField(), attribute.getId());
        }

        for (DataDictonary dataDictonary : dataDictionaryDao.getAllDataDictonaries()) {
            mapDataDictionaries.put(dataDictonary.getDokumentName(), dataDictonary.getDokumentName());
        }
    }

    private void msWordGenerate(int id) throws Exception {
        XWPFDocument document = new XWPFDocument();
        FileOutputStream out = new FileOutputStream(new File("createparagraph.docx"));
        DataDictonary dataDictionary = dataDictionaryDao.getAttribute(id);
        XWPFParagraph paragraph = document.createParagraph();
        XWPFRun run = paragraph.createRun();
        run.addBreak();
        run.setText("Kode Data Dictionary");
        run.addTab();
        run.setText(": " + dataDictionary.getKodeDataDictionary());
        run.addBreak();
        run.setText("Kode Proses");
        run.addTab();
        run.addTab();
        run.setText(": " + dataDictionary.getProcessCode());
        run.addBreak();
        run.setText("Nama Proses");
        run.addTab();
        run.addTab();
        run.setText(": " + dataDictionary.getProcessName());
        run.addBreak();
        run.setText("Aktivitas");
        run.addTab();
        run.addTab();
        run.setText(": " + dataDictionary.getActivity());
        run.addBreak();
        run.setText("Aktor");
        run.addTab();
        run.addTab();
        run.addTab();
        run.setText(": " + dataDictionary.getActor());
        run.addBreak();
        run.setText("Relasi");
        run.addTab();
        run.addTab();
        run.addTab();
        run.setText(": " + dataDictionary.getRelation());
        run.addBreak();
        run.setText("Atribut");
        run.addTab();
        run.addTab();
        run.addTab();
        run.setText(":");
        run.addBreak();
        run.setText("Deskripsi");
        run.addTab();
        run.addTab();
        run.setText(": " + dataDictionary.getDescription());
        run.addBreak();

        paragraph.setBorderBottom(Borders.BASIC_BLACK_DASHES);
        paragraph.setBorderLeft(Borders.BASIC_BLACK_DASHES);
        paragraph.setBorderRight(Borders.BASIC_BLACK_DASHES);
        paragraph.setBorderTop(Borders.BASIC_BLACK_DASHES);

        XWPFTable table = document.createTable();

        XWPFTableRow tableRowOne = table.getRow(0);
        tableRowOne.getCell(0).setText("Field");
        tableRowOne.addNewTableCell().setText("Alias");
        tableRowOne.addNewTableCell().setText("Data Type");
        tableRowOne.addNewTableCell().setText("Length");
        tableRowOne.addNewTableCell().setText("Description");

        for (DataDictionaryAttribute allDataDictionaryAttribute : dataDictonaryAttibuteDao.getAllDataDictionaryAttributes()) {
            if(allDataDictionaryAttribute.getDataDictionaryId() == id)
            {
                XWPFTableRow tableRowTwo = table.createRow();
                tableRowTwo.getCell(0).setText(attributeDao.getAttribute(allDataDictionaryAttribute.getAttributeId()).getField());
                tableRowTwo.getCell(1).setText(attributeDao.getAttribute(allDataDictionaryAttribute.getAttributeId()).getAlias());
                tableRowTwo.getCell(2).setText(attributeDao.getAttribute(allDataDictionaryAttribute.getAttributeId()).getDataType());
                tableRowTwo.getCell(3).setText(attributeDao.getAttribute(allDataDictionaryAttribute.getAttributeId()).getLength());
                tableRowTwo.getCell(4).setText(attributeDao.getAttribute(allDataDictionaryAttribute.getAttributeId()).getDescription());
            }
            
        }


        run.setText(table.getText());

        document.write(out);
        out.close();
        System.out.println("createparagraph.docx written successfully");
    }

    private void loadAttributesBaseOnDataObject(String newValue) {
        items.clear();
        String[] split = mapDeskripsi.get(newValue).split("#");
        for (int i = 0; i < split.length; i++) {
            if (i == 0) {
            } else {
                if (mapStoredAttributes.get(split[i]) != null) {
                    System.out.println(mapStoredAttributes.get(split[i]));
                    if (split[i].equalsIgnoreCase(attributeDao.getAttribute(mapStoredAttributes.get(split[i])).getField())) {
                        System.out.println(split[i] + " : " + attributeDao.getAttribute(mapStoredAttributes.get(split[i])).getField());
                        items.add(attributeDao.getAttribute(mapStoredAttributes.get(split[i])));
                    }
                } else {
                    items.add(new Attribute(
                            attributeDao.getAllAttributes().size() + 1, split[i], "", "", "", ""));
                }
            }
        }
    }

    private void selectListViewItem() {
        tableViewDD.getSelectionModel().setCellSelectionEnabled(false);
        data = null;
        cellValue = "";
        reset();
        listview.getSelectionModel().selectedItemProperty()
                .addListener(new ChangeListener<String>() {
                    public void changed(
                            ObservableValue<? extends String> observable,
                            String oldValue, String newValue) {
                        tfDokumen.setText(newValue);
                        tfAktivitas.setText(mapDataObjectActivity.get(newValue));
                        tfAktor.setText(mapActor.get(newValue));
                        loadAttributesBaseOnDataObject(newValue);
                    }
                });
        clearTable();
        loadTable();
    }

    private void selectTableViewItem() {
        tableViewDD.getSelectionModel().setCellSelectionEnabled(true);
        ObservableList selectedCells = tableViewDD.getSelectionModel().getSelectedCells();
        selectedCells.addListener(new ListChangeListener() {
            @Override
            public void onChanged(ListChangeListener.Change c) {
                TablePosition tablePosition = (TablePosition) selectedCells.get(0);
                Object val = tablePosition.getTableColumn().getCellData(tablePosition.getRow());
                cellValue = (String) val;
                for (Attribute item : items) {
                    if (cellValue.equalsIgnoreCase(item.getField())) {
                        tfField.setText(item.getField());
                        tfAlias.setText(item.getAlias());
                        cbDataType.setValue(item.getDataType());
                        tfLength.setText(item.getLength());
                        taDescription.setText(item.getDescription());
                        data = new Attribute(item.getId(), item.getField(), item.getDataType(), item.getLength(),
                                item.getDescription(), item.getAlias());
                    }
                }
            }
        });
    }

    @FXML
    private void addUpdateAtrributes(ActionEvent event) {
        ArrayList<String> errors = new ArrayList<>();
        if (tfField.getText().equalsIgnoreCase("")) {
            errors.add("Kolom field tidak boleh kosong");
        }
        if (tfLength.getText().equalsIgnoreCase("")) {
            errors.add("Kolom length tidak boleh kosong");
        }
//        if (taDescription.getText().equalsIgnoreCase("")) {
//            errors.add("Kolom deskripsi tidak boleh kosong");
//        }
        if (errors.size() > 0) {
            Alert test = new Alert(Alert.AlertType.WARNING);
            test.setTitle("Notification");
            test.setHeaderText("Gagal digenerate!");
            String message = "";
            for (String error : errors) {
                message = message + "\n" + error;
            }
            test.setContentText(message);
            test.showAndWait();
        } else {
            if (tfField.getText().equalsIgnoreCase("") || tfLength.getText().equalsIgnoreCase("")) {
            } else {
                if (data != null) {
                    int id = 0;
                    for (Attribute item : items) {
                        if (item.getField().equalsIgnoreCase(cellValue)) {
                            try {
                                System.out.println("==yang uda ada");
                                items.get(id).setField(tfField.getText());
                                items.get(id).setDataType(cbDataType.getValue().toString());
                                items.get(id).setDescription(taDescription.getText());
                                items.get(id).setLength(tfLength.getText());
                                items.get(id).setAlias(tfAlias.getText());
                                tfField.clear();
                                tfAlias.clear();
                                tfLength.clear();
                                taDescription.clear();
                            } catch (Exception e) {
                            }
                        }
                        id++;
                    }
                } else {
                    System.out.println("==baru");
                    items.add(new Attribute(
                            items.size() + 1,
                            tfField.getText(),
                            cbDataType.getValue().toString(),
                            tfLength.getText(),
                            taDescription.getText(),
                            tfAlias.getText()));
                    tfField.clear();
                    tfAlias.clear();
                    tfLength.clear();
                    taDescription.clear();
                }
                data = null;
                loadTable();
            }
        }
    }

    private void loadDataType() {
        mapDataType.put("String", "255");
        mapDataType.put("Number", "11");
        mapDataType.put("Currency", "50");
        mapDataType.put("Date", "10");

        for (Map.Entry<String, String> entry2 : mapDataType.entrySet()) {
            options.add(entry2.getKey());
        }

        options.forEach((option) -> {
            cbDataType.getItems().add(option);
        });
    }

    private void write() throws Exception {
            dataDictionaryDao.saveDataDictonary(new DataDictonary(0, tfKodeDataDictionary.getText(), tfDokumen.getText(),
                    tfKode.getText(), tfNamaProses.getText(), tfAktivitas.getText(),
                    tfAktor.getText(), tfRelasi.getText(), tfDeskripsi.getText()));
//=======================================================================================================        
            ArrayList<Attribute> attributes = (ArrayList<Attribute>) attributeDao.getAllAttributes();
            items.forEach((item) -> {
                int flag = 0;
                for (Attribute attribute : attributes) {
                    if (attribute.getField().equalsIgnoreCase(item.getField())) {
                        break;
                    } else {
                        flag++;
                    }
                    if (flag == attributes.size()) {
                        item.setId(0);
                        attributeDao.saveAttribute(item);
                    }
                }
                flag = 0;
            });
//=======================================================================================================        
            int idDataDictionary = 0;
            for (DataDictonary dataDictonary : dataDictionaryDao.getAllDataDictonaries()) {
                if (dataDictonary.getProcessName().equalsIgnoreCase(tfNamaProses.getText())) {
                    idDataDictionary = dataDictonary.getId();
                }
            }
            int id = idDataDictionary;
            msWordGenerate(id);
            ArrayList<Attribute> currentAtributes = (ArrayList<Attribute>) attributeDao.getAllAttributes();
            items.forEach((item) -> {
                for (Attribute attribute : currentAtributes) {
                    if (item.getField().equalsIgnoreCase(attribute.getField())) {
                        dataDictonaryAttibuteDao.saveDataDictionaryAttribute(
                                new DataDictionaryAttribute(0, id, attribute.getId()));
                    }
                }
            });
//=======================================================================================================                
            try {
                msWordGenerate(id);
            } catch (Exception ex) {
                Logger.getLogger(UtamaController.class.getName()).log(Level.SEVERE, null, ex);
            }

            System.out.println("Sukses fungsi write!");
        
    }

    @FXML
    private void generateToJSON() throws Exception {
        ArrayList<String> errors = new ArrayList<>();
        if (tfDokumen.getText().equalsIgnoreCase("")) {
            errors.add("Kolom dokumen tidak boleh kosong");
        }
        if (tfKode.getText().equalsIgnoreCase("")) {
            errors.add("Kolom kode tidak boleh kosong");
        }
        if (tfNamaProses.getText().equalsIgnoreCase("")) {
            errors.add("Kolom nama proses tidak boleh kosong");
        }
        if (tfAktivitas.getText().equalsIgnoreCase("")) {
            errors.add("Kolom aktivitas tidak boleh kosong");
        }
        if (tfAktor.getText().equalsIgnoreCase("")) {
            errors.add("Kolom Aktor tidak boleh kosong");
        }
//        if (tfRelasi.getText().equalsIgnoreCase("")) {
//            errors.add("Kolom relasi tidak boleh kosong");
//        }
        if (errors.size() > 0) {
            Alert test = new Alert(Alert.AlertType.WARNING);
            test.setTitle("Notification");
            test.setHeaderText("Gagal digenerate!");
            String message = "";
            for (String error : errors) {
                message = message + "\n" + error;
            }
            test.setContentText(message);
            test.showAndWait();
        } else {
            write();
            read();
            Gson gson = new GsonBuilder().setPrettyPrinting().create();
            ArrayList<Attribute> generatedAttributes = new ArrayList();

            JSONObject obj = new JSONObject();
            obj.put("dataDictionaryCode", tfKodeDataDictionary.getText());
            obj.put("documentName", tfDokumen.getText());
            obj.put("processCode", tfKode.getText());
            obj.put("processName", tfNamaProses.getText());
            obj.put("activity", tfAktivitas.getText());
            obj.put("actor", tfAktor.getText());
            obj.put("relation", tfRelasi.getText());
            obj.put("description", tfDeskripsi.getText());

            JSONArray list = new JSONArray();
            items.forEach((item) -> {
                JSONObject obj2 = new JSONObject();
                obj2.put("field", item.getField());
                obj2.put("dataType", item.getDataType());
                obj2.put("length", item.getLength());
                obj2.put("description", item.getDescription());
                obj2.put("alias", item.getAlias());
                list.add(obj2);
                generatedAttributes.add(new Attribute(item.getId(), item.getField(), item.getDataType(),
                        item.getLength(), item.getDescription(), item.getAlias()));
            });
            obj.put("attributes", list);
            String jsonStringss = gson.toJson(obj);

            System.out.print(jsonStringss);

            try (FileWriter file = new FileWriter("d:\\" + tfDokumen.getText() + ".json")) {

                file.write(jsonStringss);
                file.flush();

            } catch (IOException e) {
                e.printStackTrace();
            }

            reset();
            tfKode.clear();
            tfRelasi.clear();
            tfDeskripsi.clear();
            tfAktivitas.clear();
            tfAktor.clear();

            Alert test = new Alert(Alert.AlertType.INFORMATION);
            test.setTitle("Notification");
            test.setHeaderText("Berhasil digenerate!");
            test.showAndWait();
            clearTable();
//            listview.getItems().remove(tfDokumen.getText());
            cellValue = "";
        }
    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        tableViewDD.setEditable(true);
        field.setCellValueFactory(new PropertyValueFactory<Attribute, String>("field"));
        dataType.setCellValueFactory(new PropertyValueFactory<Attribute, String>("dataType"));
        length.setCellValueFactory(new PropertyValueFactory<Attribute, String>("length"));
        description.setCellValueFactory(new PropertyValueFactory<Attribute, String>("description"));
        alias.setCellValueFactory(new PropertyValueFactory<Attribute, String>("alias"));
        loadTable();
        loadDataType();
        selectListViewItem();
        selectTableViewItem();
        selectComboBoxItem();
        tfKodeDataDictionary.setText("DD-BP-DDiak-");

        read();

        Image img1 = new Image(getClass().getResourceAsStream("/icons8-plus-26.png"));
        Image img2 = new Image(getClass().getResourceAsStream("/icons8-delete-50.png"));
        Image img3 = new Image(getClass().getResourceAsStream("/icons8-synchronize-24.png"));

        ImageView iv1 = new ImageView(img1);
        iv1.setFitHeight(25);
        iv1.setFitWidth(25);
        btnTambah.setGraphic(iv1);
        ImageView iv2 = new ImageView(img2);
        iv2.setFitHeight(25);
        iv2.setFitWidth(25);
        btnDelete.setGraphic(iv2);

        ImageView iv3 = new ImageView(img3);
        iv3.setFitHeight(25);
        iv3.setFitWidth(25);
        btnReset.setGraphic(iv3);
    }

    @FXML
    private void deleteData() {
        if (cellValue.equalsIgnoreCase("")) {
        } else {
            int id = 0;
            for (Attribute item : items) {
                if (item.getField().equalsIgnoreCase(cellValue)) {
                    items.remove(id);
                }
                id++;
            }
            reset();
            loadTable();
            cellValue = "";
        }
    }

    @FXML
    private void resetForm() {
        reset();
    }

    private void reset() {
        tfField.clear();
        tfAlias.clear();
        tfLength.clear();
        taDescription.clear();
        cellValue = "";
    }

    private void clearTable() {
        tableViewDD.getItems().removeAll(items);
    }

    private void loadTable() {
        tableViewDD.refresh();
        tableViewDD.sort();
        tableViewDD.setItems(items);
    }

    private void selectComboBoxItem() {
        cbDataType.getSelectionModel().selectedItemProperty()
                .addListener(new ChangeListener<String>() {
                    public void changed(
                            ObservableValue<? extends String> observable,
                            String oldValue, String newValue) {
                        tfLength.setText(mapDataType.get(newValue));
                    }
                });
    }
}